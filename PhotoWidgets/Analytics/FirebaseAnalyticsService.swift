//
//  FirebaseAnalyticsService.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 20.10.2022.
//

import UIKit
import FirebaseAnalytics

/// The analytics service implementation
class FirebaseAnalyticsService: AnalyticsServiceProtocol {
    static let shared: FirebaseAnalyticsService = FirebaseAnalyticsService()
    
    private init() {}
    
    func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        // Firebase has already been initialised
    }
    
    func send(event: AnalyticsEventProtocol) {
        Analytics.logEvent(event.name, parameters: event.parameters)
    }
    
    func setDefinition(_ definition: AnalyticsDefinitionProtocol) {
        Analytics.setUserProperty(definition.parameter, forName: definition.name)
    }
}
