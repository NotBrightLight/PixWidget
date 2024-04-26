//
//  SaveImageViewModel.swift
//  Photo Widgets
//
//  Created by Артем Васин on 23.09.2022.
//

import UIKit
import SwiftUI

class SaveImageViewModel: ObservableObject {
    private let imgDownloader = ImageDownloader()
    
    @Published var isImageLoading = true
    @Published var image: UIImage?
    
    @Published var showError = false
    @Published var errorMsg = "" {
        didSet {
            withAnimation(.easeIn(duration: 0.1)) {
                showError = true
            }
        }
    }
    
    @Published var showImgSavedSuccessfully = false {
        didSet {
            print(showImgSavedSuccessfully)
        }
    }
    
    @MainActor
    func loadImage(url: URL) async {
        do {
            try await image = imgDownloader.download(url: url)
            isImageLoading = false
        } catch {
            errorMsg = NSLocalizedString("error.loadImage", comment: "failed to load image")
        }
    }
    
    func saveImage() {
        guard let image else { return }
        
        let imageSaver = ImageSaver()
        
        imageSaver.successHandler = {
            self.showImgSavedSuccessfully = true
            FirebaseAnalyticsService.shared.send(event: AnalyticsEvent.imageSaved(success: true))
        }
        
        imageSaver.errorHandler = { error in
            self.errorMsg = NSLocalizedString("error.saveImage", comment: "failed to save image")
            FirebaseAnalyticsService.shared.send(event: AnalyticsEvent.imageSaved(success: false))
        }
        
        imageSaver.writeToAlbum(image: image)
    }
}
