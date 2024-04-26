//
//  InstructionsView.swift
//  PhotoWidgets
//
//  Created by Артем Васин on 18.10.2022.
//

import SwiftUI

struct InstructionsView: View {
    let instructionTexts: [(title: String, text: String)] = [
        (NSLocalizedString("instructions.1.title", comment: "instruction 1 title"), NSLocalizedString("instructions.1.text", comment: "instruction 1 text")),
        (NSLocalizedString("instructions.2.title", comment: "instruction 2 title"), NSLocalizedString("instructions.2.text", comment: "instruction 2 text")),
        (NSLocalizedString("instructions.3.title", comment: "instruction 3 title"), NSLocalizedString("instructions.3.text", comment: "instruction 3 text")),
        (NSLocalizedString("instructions.4.title", comment: "instruction 4 title"), NSLocalizedString("instructions.4.text", comment: "instruction 4 text")),
        (NSLocalizedString("instructions.5.title", comment: "instruction 5 title"), NSLocalizedString("instructions.5.text", comment: "instruction 5 text")),
        (NSLocalizedString("instructions.6.title", comment: "instruction 6 title"), NSLocalizedString("instructions.6.text", comment: "instruction 6 text")),
        (NSLocalizedString("instructions.7.title", comment: "instruction 7 title"), NSLocalizedString("instructions.7.text", comment: "instruction 7 text")),
    ]
    
    var body: some View {
        TabView {
            ForEach(1...7, id: \.self) { index in
                VStack {
                    Image("img-instructions-\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text(instructionTexts[index-1].title)
                        .font(.title3)
                        .bold()
                    
                    Spacer().frame(height: 10)
                    
                    Text(instructionTexts[index-1].text)
                        .lineLimit(4, reservesSpace: true)
                    
                    Spacer().frame(height: 50)
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.label
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.secondaryLabel
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
