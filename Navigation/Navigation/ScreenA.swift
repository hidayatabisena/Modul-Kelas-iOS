//
//  ScreenA.swift
//  Navigation
//
//  Created by Hidayat Abisena on 12/11/23.
//

import SwiftUI

struct ScreenA: View {
    @State private var isPresented = false
    @StateObject var person = Person(name: "John", age: 25)
    @StateObject var sharedData = SharedData(image: UIImage(named: "neon")!)
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(uiImage: sharedData.image)
                    .resizable()
                    .scaledToFit()
                    
                Text("Person name: \(person.name), age: \(person.age)")
                
                Text("Ini Screen A")
                    .foregroundStyle(Color.white)
                    .background(Color.purple)
                
                Button("Go to B") {
                    isPresented = true
                }
                .fullScreenCover(isPresented: $isPresented) {
                    ScreenB(isPresented: $isPresented)
                        //.environmentObject(person)
                        .environmentObject(sharedData)
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Screen A")
        }
    }
}


#Preview {
    ScreenA()
}
