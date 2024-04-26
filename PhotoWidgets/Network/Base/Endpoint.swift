//
//  Endpoint.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 22.03.2023.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var parameters: [String: String]? { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
}

extension Endpoint {
    func getAPIKeyFromInfoPlist(_ keyName: String) -> String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: keyName) as? String else { return "" }
        return key
    }
}
