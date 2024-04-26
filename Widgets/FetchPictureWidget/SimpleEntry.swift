//
//  SimpleEntry.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 29.09.2022.
//

import WidgetKit
import UIKit

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: FetchPictureWidgetConfigurationIntent
    let downloadURL: String?
    let image: UIImage?
}
