//
//  Cat.swift
//  TheCats Watch App
//
//  Created by Hidayat Abisena on 05/12/23.
//

import Foundation

struct Cat: Codable, Identifiable {
    let id: Int
    let user_id: String
    let image_id: String
    let sub_id: String
    let created_at: Date
    let image: CatImage
}

struct CatImage: Codable {
    let id: String
    let url: String
}



