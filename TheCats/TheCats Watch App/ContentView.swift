//
//  ContentView.swift
//  TheCats Watch App
//
//  Created by Hidayat Abisena on 05/12/23.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    @StateObject private var viewModel = CatViewModel()
    
    var body: some View {
        List(viewModel.cats) { cat in
            AsyncImage(url: URL(string: cat.image.url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
        }
        .task {
            await viewModel.fetchFavoriteCats()
        }
    }
}

#Preview {
    ContentView()
}
