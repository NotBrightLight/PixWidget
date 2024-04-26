//
//  SettingsStoreService.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 18.10.2022.
//

import Foundation

class SettingsStoreService {
    let defaults: UserDefaults
    
    init(defaultsStoreName: String) {
        defaults = UserDefaults(suiteName: defaultsStoreName)!
    }
}

extension SettingsStoreService: SettingsStore {
    var refreshInterval: Int {
        return defaults.integer(forKey: AppUserDefaultsKeys.refreshInterval)
    }
    
    func setRefreshInterval(newInterval: Int) {
        defaults.set(newInterval, forKey: AppUserDefaultsKeys.refreshInterval)
    }
}
