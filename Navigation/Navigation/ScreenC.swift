//
//  ScreenC.swift
//  Navigation
//
//  Created by Hidayat Abisena on 12/11/23.
//

import SwiftUI

struct ScreenC: View {
    @EnvironmentObject var person: Person
    @Binding var isPresented: Bool
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(uiImage: sharedData.image)
                    .resizable()
                    .scaledToFit()
                // Text("Person name: \(person.name), age: \(person.age)")
            }
            .navigationBarTitle("Screen C", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
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
    ScreenC(isPresented: .constant(false))
        //.environmentObject(Person(name: "John", age: 25))
        .environmentObject(SharedData(image: UIImage(named: "neon")!))
}
