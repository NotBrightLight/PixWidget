//
//  ImageDownloader.swift
//  Photo Widgets
//
//  Created by Артем Васин on 03.09.2022.
//

import SwiftUI

enum FetchError: Error {
    case invalidServerResponse
    case badImage
}

final class ImageDownloader {
    func download(url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.invalidServerResponse }
        guard let img = UIImage(data: data) else { throw FetchError.badImage }
        return img
    }
}
