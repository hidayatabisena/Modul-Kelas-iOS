//
//  DragGestureView.swift
//  Gestures
//
//  Created by Hidayat Abisena on 13/12/23.
//

import SwiftUI

struct DragGestureView: View {
    private let originalPosition = CGPoint(x: 150, y: 150)
    @State private var position = CGPoint(x: 150, y: 150)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.pink)
                .position(position)
                .frame(width: 200 , height: 200)
                .gesture(DragGesture()
                    .onChanged{ value in
                        position = value.location
                    }
                    .onEnded { _ in
                        position = originalPosition
                        
                    }
                         
                )
        }
    }
}

#Preview {
    DragGestureView()
}
