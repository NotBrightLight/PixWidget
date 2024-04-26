//
//  AnalyticsDefinition.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 12.03.2023.
//

import Foundation

/// The list of definitions using an Enum
enum AnalyticsDefinition: AnalyticsDefinitionProtocol {
    case widgetRefreshInterval(seconds: String)
    
    var name: String {
        switch self {
        case .widgetRefreshInterval:    return "widget_refresh_interval"
        }
    }
    
    var parameter: String? {
        switch self {
        case .widgetRefreshInterval(let seconds):   return seconds
        }
    }
}
