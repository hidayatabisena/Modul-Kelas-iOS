//
//  ContentView.swift
//  ScrollView
//
//  Created by Hidayat Abisena on 15/12/23.
//

import SwiftUI

struct ContentView: View {
    
    var images = [
        "paris-eiffeltower-1",
        "paris-louvre-1",
        "rome-colosseum-1",
        "rome-pantheon-2",
        "rome-trevifountain-2",
        "rome-trevifountain-3"
    ]
    
    let screenWidth = UIScreen.main.bounds.width
    let imageWidth: CGFloat = 300
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(images, id: \.self) { image in
                    GeometryReader { reader in
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .offset(
                                x: calculateOffset(
                                    scrollOffset: reader.frame(
                                        in: .global
                                    )
                                    .minX
                                )
                            )
                            .frame(width: imageWidth, height: 450)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 20)
                            )
                            .scrollTransition(axis: .horizontal) { image, phase in
                                image.scaleEffect(phase.isIdentity ? 1 : 0)
                            }
                    }
                    .frame(width: imageWidth, height: 450)
                }
            }
            .padding(.horizontal, (screenWidth - imageWidth) / 2)
            .scrollTargetLayout()
        }
        //.contentMargins(20, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
        .listRowInsets(EdgeInsets())
    }
    
    func calculateOffset(scrollOffset: CGFloat) -> CGFloat {
        let center = (screenWidth - imageWidth) / 2
        let adjustedOffset = scrollOffset - center
        return adjustedOffset / 5
    }
}

#Preview {
    ContentView()
}
