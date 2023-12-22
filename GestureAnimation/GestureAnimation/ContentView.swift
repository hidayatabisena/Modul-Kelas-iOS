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
    
    var body: some View {
        Image(imageToShow)
            .scaleEffect(isImagePressed ? 0.9 : 1.0)
            .animation(.easeInOut, value: isImagePressed)
            .onAppear {
                withAnimation(.spring()) {
                    self.isImagePressed = false
                }
            }
            .gesture(
                TapGesture().onEnded { _ in
                    handleTapGesture()
                }
            )
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
}


#Preview {
    ContentView()
}
