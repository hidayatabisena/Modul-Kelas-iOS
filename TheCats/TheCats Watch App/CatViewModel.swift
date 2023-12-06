//
//  CatViewModel.swift
//  TheCats Watch App
//
//  Created by Hidayat Abisena on 05/12/23.
//

import Foundation
import SwiftUI

class CatViewModel: ObservableObject {
    @Published var cats = [Cat]()
    
    func fetchFavoriteCats() async {
        guard let url = URL(string: Constants.catAPIURL) else { return }
        
        var request = URLRequest(url: url)
        request.addValue(Constants.apiKey, forHTTPHeaderField: "x-api-key")
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder -> Date in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" 
            
            if let date = formatter.date(from: dateString) {
                return date
            } else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date format")
            }
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response")
                return
            }
            
            let cats = try decoder.decode([Cat].self, from: data)
            
            DispatchQueue.main.async {
                self.cats = cats
            }
        } catch {
            print("Error fetching favorite cats: \(error)")
        }
    }
    
}
