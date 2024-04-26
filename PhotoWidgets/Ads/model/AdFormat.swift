//
//  AdFormat.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 18.10.2022.
//

import Foundation
import GoogleMobileAds

enum AdFormat {
    
    case largeBanner
    case mediumRectangle
    case adaptiveBanner
    
    var adSize: GADAdSize {
        switch self {
        case .largeBanner: return GADAdSizeLargeBanner
        case .mediumRectangle: return GADAdSizeMediumRectangle
        case .adaptiveBanner: return GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(UIScreen.main.bounds.size.width)
        }
    }
    
    var size: CGSize {
        adSize.size
    }
}
