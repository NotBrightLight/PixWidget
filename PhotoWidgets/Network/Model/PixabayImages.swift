//
//  PixabayImages.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 22.03.2023.
//

import Foundation

// MARK: - PixabayImagesList
struct PixabayImagesList: Codable {
    let total: Int
    let totalHits: Int
    let hits: [PixabayImage]

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case totalHits = "totalHits"
        case hits = "hits"
    }
}

// MARK: - PixabayImage
struct PixabayImage: Codable {
    let id: Int
    let pageURL: String
    let type: PixabayImageType
    let tags: String
    let previewURL: String
    let previewWidth: Int
    let previewHeight: Int
    let webformatURL: String
    let webformatWidth: Int
    let webformatHeight: Int
    let largeImageURL: String
    let imageWidth: Int
    let imageHeight: Int
    let imageSize: Int
    let views: Int
    let downloads: Int
    let collections: Int
    let likes: Int
    let comments: Int
    let userid: Int
    let user: String
    let userImageURL: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case pageURL = "pageURL"
        case type = "type"
        case tags = "tags"
        case previewURL = "previewURL"
        case previewWidth = "previewWidth"
        case previewHeight = "previewHeight"
        case webformatURL = "webformatURL"
        case webformatWidth = "webformatWidth"
        case webformatHeight = "webformatHeight"
        case largeImageURL = "largeImageURL"
        case imageWidth = "imageWidth"
        case imageHeight = "imageHeight"
        case imageSize = "imageSize"
        case views = "views"
        case downloads = "downloads"
        case collections = "collections"
        case likes = "likes"
        case comments = "comments"
        case userid = "user_id"
        case user = "user"
        case userImageURL = "userImageURL"
    }
}

enum PixabayImageType: String, Codable {
    case photo = "photo"
}
