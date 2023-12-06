//
//  LinksVariant.swift
//  AllWebView
//
//  Created by Hidayat Abisena on 07/12/23.
//

import SwiftUI

struct LinksVariant: View {
    var body: some View {
        NavigationStack {
            List {
                
                Link("Website", destination: URL(string: "https://hidayatabisena.com")!)
                Link("Twitter", destination: URL(string: "https://twitter.com/hidayatabisena")!)
                Link(destination: URL(string: "https://twitter.com/hidayatabisena")!) {
                    Label("Twitter", systemImage: "link")
                        .foregroundColor(.pink)
                        .underline(true, color: .pink)
                }
            }
            .foregroundColor(.black)
            .navigationTitle("About")
        }
    }
}

#Preview {
    LinksVariant()
}
