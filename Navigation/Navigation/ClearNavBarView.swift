//
//  ClearNavBarView.swift
//  Navigation
//
//  Created by Hidayat Abisena on 21/11/23.
//

import SwiftUI

struct ClearNavBarView: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = nil
        appearance.backgroundColor = .clear
        appearance.shadowColor = nil
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<100) { i in
                    Text("Item \(i)")
                }
            }
            .listStyle(.plain)
            //.navigationBarHidden(true)
            .navigationTitle("My list")
        }
        .offset(y: -44)
    }
}

#Preview {
    ClearNavBarView()
}
