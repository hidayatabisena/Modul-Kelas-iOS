//
//  ContentView.swift
//  MagicValues
//
//  Created by Hidayat Abisena on 28/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 0
    @State private var showWarning = false
    
    var body: some View {
        VStack(spacing: Spacing.defaultVerticalSpacing) {
            Image(systemName: SFSymbols.globeIcon)
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(Strings.helloWorld)
            Button {
                if number < Numbers.maximumNumber {
                    number += 1
                } else {
                    showWarning.toggle()
                }
                
            } label: {
                Text(Strings.tapButtonText)
            }
            .buttonStyle(.bordered)
            Text("\(number)")
        }
        .padding()
        .alert(String(format: Strings.Error.maximumNumber, number), isPresented: $showWarning) {
            Button(Strings.okeyText) {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
