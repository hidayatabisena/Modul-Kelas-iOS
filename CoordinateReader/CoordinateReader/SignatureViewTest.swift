//
//  SignatureViewTest.swift
//  CoordinateReader
//
//  Created by Hidayat Abisena on 29/11/23.
//

import SwiftUI
import SwiftUIDigitalSignature

struct SignatureViewTest: View {
    @State private var signatureImage: UIImage? = nil
    @State private var signatureLocation: CGPoint = .zero
    @State private var cornerPositions: CornerPositions = CornerPositions(topLeft: .zero, topRight: .zero, bottomLeft: .zero, bottomRight: .zero)
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                SignatureView(
                    availableTabs: [.draw, .image, .type],
                    onSave: { image in
                        self.signatureImage = image
                    },
                    onCancel: {
                    
                    }
                )
                .scaledToFit()
                .position(signatureLocation)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let newPosition = CGPoint(x: self.signatureLocation.x + value.translation.width, y: self.signatureLocation.y + value.translation.height)
                            self.signatureLocation = newPosition
                            self.updateCornerPositions(signatureLocation: newPosition, geometry: geometry)
                        }
                        .onEnded { value in
                            self.signatureLocation = CGPoint(x: self.signatureLocation.x + value.translation.width, y: self.signatureLocation.y + value.translation.height)
                            self.updateCornerPositions(signatureLocation: self.signatureLocation, geometry: geometry)
                        }
                )
                .position(self.signatureLocation)
                .coordinateSpace(name: "coordinateSpace")
            }
            
            Text("Signature Location (x, y): \(Int(signatureLocation.x)), \(Int(signatureLocation.y))")
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
    
    private func updateCornerPositions(signatureLocation: CGPoint, geometry: GeometryProxy) {
        let signatureSize = CGSize(width: 300, height: 200) // Signature view size, change as needed
        
        let topLeft = CGPoint(x: signatureLocation.x - signatureSize.width / 2, y: signatureLocation.y - signatureSize.height / 2)
        let topRight = CGPoint(x: signatureLocation.x + signatureSize.width / 2, y: signatureLocation.y - signatureSize.height / 2)
        let bottomLeft = CGPoint(x: signatureLocation.x - signatureSize.width / 2, y: signatureLocation.y + signatureSize.height / 2)
        let bottomRight = CGPoint(x: signatureLocation.x + signatureSize.width / 2, y: signatureLocation.y + signatureSize.height / 2)
        
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


#Preview {
    SignatureViewTest()
}
