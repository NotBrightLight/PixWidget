//
//  AnalyticsEventProtocol.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 20.10.2022.
//

public protocol AnalyticsEventProtocol {
    /// This is the identifier
    var name: String { get }
    
    /// the dictionary that will be sent to the SDK
    var parameters: [String: Any]? { get }
}

extension AnalyticsEventProtocol {
    // Default Implementation
    var parameters: [String: Any]? { return nil }
}
