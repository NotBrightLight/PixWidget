//
//  AppMain.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 29.09.2022.
//

import SwiftUI
import FirebaseCore
import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        FirebaseAnalyticsService.shared.initialize(application: application, launchOptions: launchOptions)
        
//        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        return true
    }
}

@main
struct PhotoWidgetsApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
