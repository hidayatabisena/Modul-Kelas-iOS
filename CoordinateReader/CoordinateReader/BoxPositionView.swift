//
//  BoxPositionView.swift
//  CoordinateReader
//
//  Created by Hidayat Abisena on 28/11/23.
//

import SwiftUI

struct BoxPositionView: View {
    var body: some View {
        VStack {
            Text("Draggable Box")
                .font(.largeTitle)
                .padding()
            DraggableBox()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    BoxPositionView()
}

struct CornerPositions {
    var topLeft: CGPoint
    var topRight: CGPoint
    var bottomLeft: CGPoint
    var bottomRight: CGPoint
}

struct DraggableBox: View {
    @GestureState private var dragState = CGSize.zero
    @State private var boxLocation: CGPoint = .zero
    @State private var cornerPositions: CornerPositions = CornerPositions(topLeft: .zero, topRight: .zero, bottomLeft: .zero, bottomRight: .zero)

    var body: some View {
        VStack {
            GeometryReader { geometry in
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .offset(self.dragState)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newPosition = CGPoint(x: self.boxLocation.x + value.translation.width, y: self.boxLocation.y + value.translation.height)
                                self.boxLocation = newPosition
                                self.updateCornerPositions(boxLocation: newPosition, geometry: geometry)
                            }
                            .onEnded { value in
                                // Perform any necessary actions when dragging ends
                                self.boxLocation = CGPoint(x: self.boxLocation.x + value.translation.width, y: self.boxLocation.y + value.translation.height)
                                self.updateCornerPositions(boxLocation: self.boxLocation, geometry: geometry)
                            }
                    )
                    .position(self.boxLocation)
                    .coordinateSpace(name: "coordinateSpace")
            }

            Text("Box Location (x, y): \(Int(boxLocation.x)), \(Int(boxLocation.y))")
                .padding()

            Text("Top Left (x, y): \(Int(cornerPositions.topLeft.x)), \(Int(cornerPositions.topLeft.y))")
                .padding(.bottom, 5)
            Text("Top Right (x, y): \(Int(cornerPositions.topRight.x)), \(Int(cornerPositions.topRight.y))")
                .padding(.bottom, 5)
            Text("Bottom Left (x, y): \(Int(cornerPositions.bottomLeft.x)), \(Int(cornerPositions.bottomLeft.y))")
                .padding(.bottom, 5)
            Text("Bottom Right (x, y): \(Int(cornerPositions.bottomRight.x)), \(Int(cornerPositions.bottomRight.y))")
                .padding(.bottom, 5)
        }
    }

    private func updateCornerPositions(boxLocation: CGPoint, geometry: GeometryProxy) {
        let boxSize = CGSize(width: 100, height: 100) // Box size, change as needed

        let topLeft = CGPoint(x: boxLocation.x - boxSize.width / 2, y: boxLocation.y - boxSize.height / 2)
        let topRight = CGPoint(x: boxLocation.x + boxSize.width / 2, y: boxLocation.y - boxSize.height / 2)
        let bottomLeft = CGPoint(x: boxLocation.x - boxSize.width / 2, y: boxLocation.y + boxSize.height / 2)
        let bottomRight = CGPoint(x: boxLocation.x + boxSize.width / 2, y: boxLocation.y + boxSize.height / 2)

        DispatchQueue.main.async {
            self.cornerPositions = CornerPositions(
                topLeft: topLeft,
                topRight: topRight,
                bottomLeft: bottomLeft,
                bottomRight: bottomRight
            )
        }
    }
}

