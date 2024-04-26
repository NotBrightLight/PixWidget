//
//  AnalyticsEvent.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 20.10.2022.
//

import Foundation

/// The list of events using an Enum
enum AnalyticsEvent: AnalyticsEventProtocol {
    case widgetRefreshIntervalSet(seconds: Int)
    case widgetTappedToSeeFullImage(imgUrl: String)
    case imageSaved(success: Bool)
    
    var name: String {
        switch self {
        case .widgetRefreshIntervalSet:     return "widget_refresh_interval_set"
        case .widgetTappedToSeeFullImage:   return "widget_tapped_to_see_full_image"
        case .imageSaved:                   return "image_saved"
        }
    }
    
    /// The parameters before used the AnalyticsEventProtocol's default implementation which
    /// always returned nil. Now we just have to create our own implementation based on the
    /// cases of this enum.
    var parameters: [String: Any]? {
        switch self {
        case .widgetRefreshIntervalSet(let seconds):        return ["new_interval_seconds": seconds]
        case .widgetTappedToSeeFullImage(let imgUrl):       return ["image_url": imgUrl]
        case .imageSaved(let success):                      return ["success": success]
        }
    }
}
