//
//  ReloadPictureIntent.swift
//  WidgetsExtension
//
//  Created by Артем Васин on 19.08.2023.
//

import AppIntents
import WidgetKit

struct ReloadPictureIntent: AppIntent {
    static var title: LocalizedStringResource = "Reload Picture"
    
    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        return .result()
    }
}
