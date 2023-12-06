//
//  FavoriteCatView.swift
//  TheCats Watch App
//
//  Created by Hidayat Abisena on 05/12/23.
//

import SwiftUI

struct FavoriteCatView: View {
    @State private var cats = [Cat2]()
    @State private var isLoading = false
    @State private var imageCache = [String: UIImage]()
    
    init() {
        fetchCats()
    }
    
    var body: some View {
        NavigationStack {
            if !isLoading {
                List(cats) { cat in
                    HStack {
                        if let image = imageCache[cat.id] {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        } else {
                            ProgressView()
                                .frame(width: 50, height: 50)
                        }
                        
                        Text(cat.id)
                    }
                }
            } else {
                ProgressView()
            }
        }
    }
    
    func fetchCats() {
        isLoading = true
        
        guard let url = URL(string: "https://api.thecatapi.com/v1/favourites") else {
            isLoading = false
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("17d94b92-754f-46eb-99a0-65be65b5d18f", forHTTPHeaderField: "x-api-key")
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let cats = try? JSONDecoder().decode([Cat2].self, from: data!) {
                DispatchQueue.main.async {
                    self.cats = cats
                    self.loadImages(for: cats)
                    self.isLoading = false
                }
            } else {
                self.isLoading = false
            }
        }
        .resume()
    }
    
    func loadImages(for cats: [Cat2]) {
        for cat in cats {
            guard let url = URL(string: cat.image.url) else {
                continue
            }
            
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageCache[cat.id] = image
                    }
                }
            }
            .resume()
        }
    }
}

struct Cat2: Identifiable, Decodable {
    let id: String
    let image: CatImage2
}

struct CatImage2: Decodable {
    let url: String
}


#Preview {
    FavoriteCatView()
}
