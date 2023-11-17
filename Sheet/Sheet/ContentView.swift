//
//  ContentView.swift
//  Sheet
//
//  Created by Hidayat Abisena on 17/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var presentSheet: Bool = false
    @State var detentHeight: CGFloat = 0
    
    var body: some View {
        Button("Tap me") {
            self.presentSheet.toggle()
        }
        .sheet(isPresented: self.$presentSheet) {
            BottomView()
                .readHeight()
                .onPreferenceChange(HeightPreferenceKey.self) { height in
                    if let height {
                        self.detentHeight = height
                    }
                }
                .presentationDetents([.height(self.detentHeight)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    ContentView()
}

struct BottomView: View {
    var body: some View {
        VStack {
            Text("Hello")
            Text("World")
            Text("Hello")
            Text("World")
        }
        .padding(.top)
    }
}
