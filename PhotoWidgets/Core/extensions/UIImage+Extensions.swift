//
//  UIImage+Extensions.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 22.03.2023.
//

import UIKit
import AVFoundation

extension UIImage {
    var widgetSize: UIImage {
        let maxSize = CGSize(width: 993, height: 993)
        
        let availableRect = AVFoundation.AVMakeRect(aspectRatio: self.size, insideRect: .init(origin: .zero, size: maxSize))
        let targetSize = availableRect.size
        
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        
        let resized = renderer.image { (context) in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        
        return resized
    }
}
