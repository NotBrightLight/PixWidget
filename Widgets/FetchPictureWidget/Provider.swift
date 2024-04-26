//
//  Provider.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 29.09.2022.
//

import SwiftUI
import Intents
import WidgetKit

enum FetchWidgetProviderError: Error {
    case outOfTries
}
 
struct Provider: IntentTimelineProvider {
    private let searchImgService = PixabayService()
    private let settingsStore = SettingsStoreService(defaultsStoreName: AppGroupKeys.mainGroup)
    private let imgDownloader = ImageDownloader()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: .now, configuration: FetchPictureWidgetConfigurationIntent(), downloadURL: nil, image: UIImage(named: "cat"))
    }
    
    func getSnapshot(for configuration: FetchPictureWidgetConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        createTimelineEntry(date: .now, configuration: configuration, completion: completion)
    }
    
    func getTimeline(for configuration: FetchPictureWidgetConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        createTimeline(date: .now, configuration: configuration, completion: completion)
    }
    
    func createTimelineEntry(date: Date, configuration: FetchPictureWidgetConfigurationIntent, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: date, configuration: configuration, downloadURL: nil, image: UIImage(named: "cat"))
        completion(entry)
    }
    
    func createTimeline(date: Date, configuration: FetchPictureWidgetConfigurationIntent, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        Task {
            let query = configuration.query ?? "cat"
            do {
                let imgUrlString = try await getRandomImageURL(query: query)
                let realImg = try await imgDownloader.download(url: URL(string: imgUrlString)!)
                let entry = SimpleEntry(date: date, configuration: configuration, downloadURL: imgUrlString, image: realImg)
                let timeLine = Timeline(entries: [entry], policy: .after(.now.advanced(by: Double(settingsStore.refreshInterval))))
                completion(timeLine)
            } catch {
                let entry = SimpleEntry(date: date, configuration: configuration, downloadURL: nil, image: nil)
                let timeLine = Timeline(entries: [entry], policy: .after(.now.advanced(by: 300))) // time must be in seconds
                completion(timeLine)
            }
        }
    }
    
    private func getRandomImageURL(query: String) async throws -> String {
        let result = await searchImgService.getImages(query: query)
        switch result {
        case .success(let images):
            return images.hits.randomElement()!.largeImageURL
        case .failure(let error):
            throw error
        }
    }
}
