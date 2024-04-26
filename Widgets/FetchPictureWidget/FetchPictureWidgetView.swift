//
//  FetchPictureWidgetView.swift
//  WidgetsExtension
//
//  Created by Артем Васин on 29.09.2022.
//

import SwiftUI

struct FetchPictureWidgetView : View {
    var entry: Provider.Entry
    
    var body: some View {
        Group {
            if #available(iOS 17, *) {
                picWidgetView17
            } else {
                picWidgetView
            }
        }
    }
    
    private var picWidgetView: some View {
        Group {
            if let image = entry.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .if(entry.downloadURL != nil) {
                        $0.widgetURL(URL(string: "pixwidget://openImg/\(entry.downloadURL!.components(separatedBy: "/").last!)"))
                    }
            } else {
                Image("no-img")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
    
    @available(iOSApplicationExtension 17.0, *)
    private var picWidgetView17: some View {
        ZStack {
            if let image = entry.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .if(entry.downloadURL != nil) {
                        $0.widgetURL(URL(string: "pixwidget://openImg/\(entry.downloadURL!.components(separatedBy: "/").last!)"))
                    }
            } else {
                Image("no-img")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            
//            Button(intent: ReloadPictureIntent()) {
//                Image(systemName: "arrow.clockwise.circle.fill")
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .containerBackground(.background, for: .widget)
    }
}
