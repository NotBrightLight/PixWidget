//
//  FetchPictureWidget.swift
//  WidgetsExtension
//
//  Created by Артем Васин on 29.09.2022.
//

import WidgetKit
import Intents
import SwiftUI

@main
struct FetchPictureWidget: Widget {
    let kind: String = "FetchPictureWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: FetchPictureWidgetConfigurationIntent.self, provider: Provider()) { entry in
            FetchPictureWidgetView(entry: entry)
        }
        .configurationDisplayName(NSLocalizedString("widgets.widgetName", comment: "Random Image"))
        .description(NSLocalizedString("widgets.widgetDescription", comment: "Displays a random image for your theme."))
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
        .containerBackgroundRemovable(false)
        .contentMarginsDisabled()
    }
}

struct FetchPictureWidget_Previews: PreviewProvider {
    static var previews: some View {
        FetchPictureWidgetView(entry: SimpleEntry(date: Date(), configuration: FetchPictureWidgetConfigurationIntent(), downloadURL: nil, image: UIImage(named: "cat")))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
