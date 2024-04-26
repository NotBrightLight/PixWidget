//
//  BannerAdView.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 18.10.2022.
//

import SwiftUI

struct BannerAdView: View {
    
    let adUnit: AdUnit
    let adFormat: AdFormat
    @State var adStatus: AdStatus = .loading
    
    var body: some View {
        HStack {
            if adStatus != .failure {
                BannerViewController(adUnitID: adUnit.unitID, adSize: adFormat.adSize, adStatus: $adStatus)
                    .frame(width: adFormat.size.width, height: adFormat.size.height)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
