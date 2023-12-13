//
//  ButtonWithModifierView.swift
//  Button
//
//  Created by Hidayat Abisena on 13/12/23.
//

import SwiftUI

struct ButtonWithModifierView: View {
    var body: some View {
        VStack(spacing: 16) {
            Button {
                print("Button tapped")
            } label: {
                HStack {
                    Spacer()
                    Text("Continue")
                    Spacer()
                }
                .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            }
            .font(.system(.title2, design: .rounded, weight: .bold))
            .foregroundStyle(Color.yellow)
            .background(Capsule().stroke(.yellow, lineWidth: 2))
            
            
            VStack(spacing: 16) {
                Button(role: .destructive) {
                    print("Button delete tapped")
                } label: {
                    Label("Delete", systemImage: "trash")
                }
                
                Button(role: .cancel) {
                    
                } label: {
                    Text("Cancel")
                }
            }
            .buttonStyle(CustomButtonStyle())
            
        }
        .padding()
    }
}

#Preview {
    ButtonWithModifierView()
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label
            Spacer()
        }
        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
        .font(.system(.title2, design: .rounded).bold())
        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
        .foregroundStyle(configuration.role == .destructive ? Color.red : Color.yellow)
        .background {
            Capsule()
                .stroke(configuration.role == .destructive ? .red : .yellow, lineWidth: 2)
        }
        .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
