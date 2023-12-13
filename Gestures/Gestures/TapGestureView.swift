//
//  TapGestureView.swift
//  Gestures
//
//  Created by Hidayat Abisena on 13/12/23.
//

import SwiftUI

struct TapGestureView: View {
    @State private var scale: Double = 1.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.pink)
                .frame(width: 250, height: 250)
                .scaleEffect(scale)
                .onTapGesture(count: 1, perform: {
                    print("1 tap")
                    scale = scale * 0.9
                })
                .highPriorityGesture(
                    TapGesture(count: 2)
                        .onEnded{
                            print("2 tap")
                            scale = scale * 1.1
                        }
                )
        }
        .padding()
    }
}

#Preview {
    TapGestureView()
}


