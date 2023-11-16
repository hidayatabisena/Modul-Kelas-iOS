//
//  ContentView.swift
//  Button
//
//  Created by Hidayat Abisena on 16/11/23.
//

import SwiftUI

enum Axis {
    case horizontally
    case vertically
}

struct ContentView: View {
    var body: some View {
        Form {
            Button(action: {
                print("Button save tapped")
            }, label: {
                Text("Save")
            })
            .align(.horizontally)
        }
    }
}

#Preview {
    ContentView()
}

extension View {
    
    @ViewBuilder
    func align(_ axis: Axis) -> some View {
        switch axis {
        case .horizontally:
            alignHorizontally()
        case .vertically:
            alignVertically()
        }
    }
    
    private func alignVertically() -> some View {
        VStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    private func alignHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
}
