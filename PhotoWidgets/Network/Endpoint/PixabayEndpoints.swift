//
//  PixabayEndpoints.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 22.03.2023.
//

import Foundation

enum PixabayEndpoint {
    case searchImages(query: String)
}

extension PixabayEndpoint: Endpoint {
    var host: String {
        return "pixabay.com"
    }
    
    var path: String {
        switch self {
        case .searchImages:
            return "/api"
        }
    }
    
    var parameters: [String: String]? {
        switch self {
        case .searchImages(let query):
            var params: [String: String] = [:]
            
            params["key"] = getAPIKeyFromInfoPlist("PIXABAY_API_KEY")
            params["q"] = query
            params["image_type"] = "photo"
            params["orientation"] = "all"
            params["per_page"] = "200"
            params["page"] = "1"
            params["safesearch"] = "true"
            
            return params
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .searchImages:
            return .get
        }
    }
    
    var header: [String: String]? {
        switch self {
        case .searchImages:
            return nil
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .searchImages:
            return nil
        }
    }
}
