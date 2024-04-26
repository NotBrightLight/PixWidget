//
//  SettingsViewModel.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 18.10.2022.
//

import WidgetKit

protocol SettingsStore {
    var refreshInterval: Int { get }
    func setRefreshInterval(newInterval: Int)
}

final class SettingsViewModel: ObservableObject {
    // 0 is just an initial value which is changed after class init()
    @Published var refreshInterval: Int = 0 {
        didSet {
            if oldValue != 0 {
                print("New widgets refresh interval: \(refreshInterval)")
                setRefreshInterval(value: refreshInterval)
            }
        }
    }
    
    private let settingsStore: SettingsStore
    
    init(settingsStore: SettingsStore) {
        self.settingsStore = settingsStore
        updateRefreshInterval()
    }
    
    func updateRefreshInterval() {
        let interval = settingsStore.refreshInterval
        if interval == 0 {
            refreshInterval = 3600
        } else {
            refreshInterval = interval
        }
    }
    
    func setRefreshInterval(value: Int) {
        settingsStore.setRefreshInterval(newInterval: value)
        FirebaseAnalyticsService.shared.send(event: AnalyticsEvent.widgetRefreshIntervalSet(seconds: value))
        FirebaseAnalyticsService.shared.setDefinition(AnalyticsDefinition.widgetRefreshInterval(seconds: String(value)))
    }
    
    /// Global reload all widgets
    func reloadWidgets() {
        WidgetCenter.shared.reloadAllTimelines()
    }
}
