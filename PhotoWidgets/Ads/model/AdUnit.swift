//
//  AdUnit.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 18.10.2022.
//

import Foundation

enum AdUnit {
    case tabBarBanner
    
    var unitID: String {
        switch self {
        case .tabBarBanner:
            return getBannerIdFromInfoPlist("BANNER_TABBAR")
        }
    }
    
    private func getBannerIdFromInfoPlist(_ keyName: String) -> String {
        guard let id = Bundle.main.object(forInfoDictionaryKey: keyName) as? String else { return "" }
        return id
    }
}
