//
//  AnalyticsDefinitionProtocol.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 12.03.2023.
//

import Foundation

public protocol AnalyticsDefinitionProtocol {
    /// This is the identifier
    var name: String { get }
    
    /// the dictionary that will be sent to the SDK
    var parameter: String? { get }
}
