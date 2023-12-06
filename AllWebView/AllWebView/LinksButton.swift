//
//  LinksButton.swift
//  AllWebView
//
//  Created by Hidayat Abisena on 07/12/23.
//

import SwiftUI

struct LinksButton: View {
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        VStack(spacing: 24) {
            Button("Open Website") {
                openURL(URL(string: "sena://invalid-url-scheme")!) { canOpen in
                    print("Can open \(canOpen)")
                    
                }
            }
            
            Button(action: {
               openURL(URL(string: "https://www.hidayatabisena.com")!)
            }, label: {
                Label("Open url", systemImage: "globe")
            })
        }
    }
}

#Preview {
    LinksButton()
}
