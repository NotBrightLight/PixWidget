//
//  ImagePreview.swift
//  Photo Widgets
//
//  Created by Артем Васин on 03.09.2022.
//

import SwiftUI
import AlertKit

struct ImagePreview: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var saveImgVM = SaveImageViewModel()
    
    var url: URL
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if saveImgVM.isImageLoading {
                ProgressView(NSLocalizedString("saveImg.loading", comment: "loading image..."))
                    .padding(.top, 80)
            } else {
                if let img = saveImgVM.image {
                    VStack {
                        Image(uiImage: img)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        
                        Button(NSLocalizedString("saveImg.save", comment: "save to photos")) {
                            saveImgVM.saveImage()
                        }
                        .buttonStyle(.bordered)
                    }
                }
            }
        }
        .task {
            FirebaseAnalyticsService.shared.send(event: AnalyticsEvent.widgetTappedToSeeFullImage(imgUrl: url.lastPathComponent))
            await saveImgVM.loadImage(url: url)
        }
        .alert(saveImgVM.errorMsg, isPresented: $saveImgVM.showError) {
            Button(NSLocalizedString("OK", comment: "OK")) {
                dismiss()
            }
        }
        .alert(isPresent: $saveImgVM.showImgSavedSuccessfully,
               view: AlertAppleMusic16View(title: NSLocalizedString("saveImg.saved", comment: "saved"), icon: .done)
        )
    }
}

struct ImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        ImagePreview(
            url: URL(string: "https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNTg4Mzl8MHwxfHNlYXJjaHwxfHxjYXR8ZW58MHwyfHx8MTY2MTUxMjkyNQ&ixlib=rb-1.2.1&q=80&w=1080")!
        )
    }
}
