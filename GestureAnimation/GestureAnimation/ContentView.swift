//
//  ContentView.swift
//  GestureAnimation
//
//  Created by Hidayat Abisena on 22/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isImagePressed = false
    @State private var imageToShow = "iOS-Dev-Boy"
    @State private var dragOffset = CGSize.zero
    @State private var imageOpacity = 0.0
    @State private var flipDegrees = 0.0
    
    var body: some View {
        Image(imageToShow)
            .scaleEffect(isImagePressed ? 0.9 : 1.0)
            .animation(.easeInOut, value: isImagePressed)
            .onAppear {
                withAnimation(.spring()) {
                    self.isImagePressed = false
                }
            }
            .opacity(imageOpacity)
            .rotation3DEffect(
                .degrees(flipDegrees),
                axis: (x: 0, y: 1, z: 0)
            )
            .offset(dragOffset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.dragOffset = gesture.translation
                    }
                    .onEnded { _ in
                        self.dragOffset = .zero
                    }
            )
            .gesture(
                TapGesture().onEnded { _ in
                    handleFlipGesture()
                }
            )
            .onAppear {
                withAnimation(.easeIn(duration: 3.0)) {
                    self.imageOpacity = 1.0
                }
            }
    }
    
    private func handleTapGesture() {
        withAnimation(.easeInOut) {
            self.isImagePressed = true
        }
        // Delay untuk animasi press sebelum berganti image
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.easeInOut) {
                // Ganti image dan reset state
                self.imageToShow = self.imageToShow == "iOS-Dev-Boy" ? "iOS-Dev-Female" : "iOS-Dev-Boy"
                self.isImagePressed = false
            }
        }
    }
    
    private func handleFlipGesture() {
        withAnimation(.easeInOut(duration: 0.5)) {
            // Update degree untuk flip
            flipDegrees += 180
            // Ganti image setelah setengah flip
            // if flipDegrees.truncatingRemainder(dividingBy: 360) == 0 {
            //    imageToShow = imageToShow == "iOS-Dev-Boy" ? "iOS-Dev-Female" : "iOS-Dev-Boy"
            // }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                withAnimation {
                    imageToShow = imageToShow == "iOS-Dev-Boy" ? "iOS-Dev-Female" : "iOS-Dev-Boy"
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
