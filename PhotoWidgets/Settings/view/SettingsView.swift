//
//  SettingsView.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 17.10.2022.
//

import SwiftUI
import Collections

struct SettingsView: View {
    @StateObject private var settingsVM = SettingsViewModel(settingsStore: SettingsStoreService(defaultsStoreName: AppGroupKeys.mainGroup))
    
    private let timeIntervals: OrderedDictionary = [
//        "1 minute": 60,
        NSLocalizedString("5min", comment: "5 minutes"): 300,
        NSLocalizedString("10min", comment: "10 minutes"): 600,
        NSLocalizedString("15min", comment: "15 minutes"): 900,
        NSLocalizedString("30min", comment: "30 minutes"): 1800,
        NSLocalizedString("1h", comment: "1 hour"): 3600,
        NSLocalizedString("2h", comment: "2 hours"): 7200,
        NSLocalizedString("4h", comment: "4 hours"): 14400,
        NSLocalizedString("6h", comment: "6 hours"): 21600,
        NSLocalizedString("12h", comment: "12 hours"): 43200,
        NSLocalizedString("1d", comment: "1 day"): 82800
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(NSLocalizedString("settings.header.refreshInterval", comment: "refresh interval of the widgets")) {
                    Picker(NSLocalizedString("settings.picker.refreshInterval", comment: "refresh Interval"),
                           selection: $settingsVM.refreshInterval) {
                        ForEach(timeIntervals.elements, id: \.value) { element in
                            Text(element.key)
                        }
                    }
                }
                
                Button(NSLocalizedString("settings.button.refreshAll", comment: "refresh all widgets")) {
                    settingsVM.reloadWidgets()
                }
            }
            .navigationTitle(NSLocalizedString("tab.settings", comment: "settings"))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
