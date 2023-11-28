//
//  ContentView.swift
//  CoordinateReader
//
//  Created by Hidayat Abisena on 28/11/23.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Draggable Box")
//                .font(.largeTitle)
//                .padding()
//            DraggableBoxView()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
//
//struct DraggableBoxView: View {
//    @State private var boxOffset: CGSize = .zero
//    @State private var boxLocation: CGPoint = .zero
//    
//    var body: some View {
//        VStack {
//            GeometryReader { geometry in
//                Rectangle()
//                    .frame(width: 100, height: 100)
//                    .foregroundColor(.blue)
//                    .offset(self.boxOffset)
//                    .gesture(
//                        DragGesture()
//                            .onChanged { value in
//                                self.boxOffset = CGSize(width: value.translation.width, height: value.translation.height)
//                                self.boxLocation = value.location
//                            }
//                            .onEnded { _ in
//                                // Perform any actions when the drag ends
//                                // If needed
//                            }
//                    )
//                    .position(self.boxLocation)
//                    .coordinateSpace(name: "coordinateSpace")
//            }
//            
//            Text("Box Location: \(Int(boxLocation.x)), \(Int(boxLocation.y))")
//                .padding()
//        }
//    }
//}
