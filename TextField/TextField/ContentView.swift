//
//  ContentView.swift
//  TextField
//
//  Created by Hidayat Abisena on 23/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    
    var body: some View {
        VStack {
            CustomTextField(text: $text, placeholder: "Enter Name")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
