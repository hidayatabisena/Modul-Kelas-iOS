//
//  GestureCombinationView.swift
//  Gestures
//
//  Created by Hidayat Abisena on 13/12/23.
//

import SwiftUI

struct GestureCombinationView: View {
    @State private var shouldMove: Bool = false
    @State private var position = CGPoint(x: 100, y: 100)
    @State private var scale: Double = 1.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.pink)
                .frame(width: 150 , height: 150)
                .position(position)
                .scaleEffect(scale)
                .gesture(
                    LongPressGesture(minimumDuration: 0.7)
                        .onEnded { _ in
                            print("long press ended")
                            shouldMove = true
                            withAnimation{
                                scale = 1.1
                            }
                        }
                        .simultaneously(
                            with: DragGesture()
                                .onChanged { gesture in
                                    if shouldMove {
                                        print("drag starts on ", gesture.location)
                                        position = gesture.location
                                    } else {
                                        print("not able to move")
                                    }
                                }
                                .onEnded { gesture in
                                    print("drag endes")
                                    shouldMove = false
                                    withAnimation{
                                        scale = 1.0
                                    }
                                }
                        )
                )
        }
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    GestureCombinationView()
}
