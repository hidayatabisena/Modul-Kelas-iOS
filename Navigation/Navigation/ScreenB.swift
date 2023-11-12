//
//  ScreenB.swift
//  Navigation
//
//  Created by Hidayat Abisena on 12/11/23.
//

import SwiftUI

struct ScreenB: View {
    @EnvironmentObject var person: Person
    @EnvironmentObject var sharedData: SharedData
    @Binding var isPresented: Bool
    @State private var isLinkActive = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(uiImage: sharedData.image)
                    .resizable()
                    .scaledToFit()
                // Text("Person name: \(person.name), age: \(person.age)")
                Text("Ini screen B")
                NavigationLink("Go to C", destination: ScreenC(isPresented: $isPresented), isActive: $isLinkActive)
            }
            // .navigationBarTitle("Screen B", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.isPresented = false
                    }) {
                        HStack {
                            Image(systemName: "arrow.left")
                            Text("Back")
                        }
                    }
                }
            }
        }
    }
}



#Preview {
    ScreenB(isPresented: .constant(false))
    //.environmentObject(Person(name: "John", age: 25))
        .environmentObject(SharedData(image: UIImage(named: "neon")!))
}
