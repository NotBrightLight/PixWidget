//
//  AnalyticsServiceProtocol.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 20.10.2022.
//

import UIKit

public protocol AnalyticsServiceProtocol {
    /// This will be called within AppDelegate application:didFinishLaunchingWithOptions: method
    /// In this method, you should initialize the SDK.
    func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    
    /// This will actually track events in the app.
    func send(event: AnalyticsEventProtocol)
    
    func setDefinition(_ definition: AnalyticsDefinitionProtocol)
}
