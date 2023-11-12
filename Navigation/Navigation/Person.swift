//
//  Person.swift
//  Navigation
//
//  Created by Hidayat Abisena on 12/11/23.
//

import Foundation
import SwiftUI

class Person: ObservableObject {
    @Published var name: String
    @Published var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class SharedData: ObservableObject {
    @Published var image: UIImage
    init(image: UIImage) {
        self.image = image
    }
}
