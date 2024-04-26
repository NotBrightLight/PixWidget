//
//  ContentView.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 29.09.2022.
//

import SwiftUI

struct ContentView: View {
    // Opening deep link image properties
    @State private var deepLinkImageUrl: IdentifiableURL?
    
    var body: some View {
        TabView {
//            VStack(spacing: 0) {
                InstructionsView()
//                BannerAdView(adUnit: .tabBarBanner, adFormat: .adaptiveBanner)
//            }
            .tabItem {
                Label(NSLocalizedString("tab.instruction", comment: "instruction"), systemImage: "info.circle.fill")
            }
            
//            VStack(spacing: 0) {
                SettingsView()
//                BannerAdView(adUnit: .tabBarBanner, adFormat: .adaptiveBanner)
//            }
            .tabItem {
                Label(NSLocalizedString("tab.settings", comment: "settings"), systemImage: "gearshape.fill")
            }
        }
        // MARK: - Widget deep link
        .onOpenURL { url in
            guard url.scheme == "pixwidget",
                  url.host == "openImg",
                  let imgUrl = URL(string: "https://pixabay.com/get/\(url.lastPathComponent)")
            else { return }
            deepLinkImageUrl = IdentifiableURL(id: imgUrl)
        }
        // MARK: - Image sheet
        .sheet(item: $deepLinkImageUrl) { idUrl in
            ImagePreview(url: idUrl.id)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/// Struct to wrap an URL to use it as an $item in .sheet()
struct IdentifiableURL: Identifiable {
    var id: URL
}
