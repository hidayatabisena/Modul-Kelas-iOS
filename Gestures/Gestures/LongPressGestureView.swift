//
//  LongPressGestureView.swift
//  Gestures
//
//  Created by Hidayat Abisena on 13/12/23.
//

import SwiftUI

struct LongPressGestureView: View {
    @State private var scale: Double = 1.0
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.pink)
                .frame(width: 200 , height: 200)
                .scaleEffect(scale)
                .gesture(
                    LongPressGesture(minimumDuration: 1)
                        .onEnded {_ in scale = scale * 0.9 }
                )
        }
    }
}

#Preview {
    LongPressGestureView()
}
