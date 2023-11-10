//
//  ContentView.swift
//  Image
//
//  Created by Hidayat Abisena on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.LKA)
                .resizable()
            //.frame(height: 225)
                .scaledToFit()
            // .padding()
                .overlay {
                    Rectangle()
                        .fill(.thinMaterial)
                    //.frame(height: 225, alignment: .bottom)
                        .mask {
                            LinearGradient(
                                colors:
                                    [Color.white.opacity(0),
                                     Color.white.opacity(0.1),
                                     Color.white.opacity(0.3),
                                     Color.white.opacity(0.8)
                                    ],
                                startPoint: .top,
                                endPoint: .bottom)
                        }
                }
            
            VStack {
                Text("AI Generated Content")
                    .foregroundStyle(.primary)
                    .font(.title)
                    .minimumScaleFactor(0.3)
                
                Text("with Bing Image Creator")
                    .foregroundStyle(.secondary)
                    .font(.title3)
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 4)
        .shadow(color: .black.opacity(0.1) , radius: 2, x: 0, y: 2)
        .padding()
    }
}

#Preview {
    ContentView()
}
