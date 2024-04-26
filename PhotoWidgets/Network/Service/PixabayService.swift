//
//  PixabayService.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 22.03.2023.
//

import Foundation

protocol PixabayServiceable {
    func getImages(query: String) async -> Result<PixabayImagesList, RequestError>
}

struct PixabayService: HTTPClient, PixabayServiceable {
    func getImages(query: String) async -> Result<PixabayImagesList, RequestError> {
        return await sendRequest(endpoint: PixabayEndpoint.searchImages(query: query), responseModel: PixabayImagesList.self)
    }
}
