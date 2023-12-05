//
//  ModernButtonView.swift
//  Button
//
//  Created by Hidayat Abisena on 05/12/23.
//

import SwiftUI

struct ModernButtonView: View {
    var body: some View {
        VStack {
            // 1. MODERN Button ZStack
            Button {
                print("This is a Modern Button")
            } label: {
                ZStack(alignment: .leading) {
                    Text("Modern Button")
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .padding(.leading, 52)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.black)
                        }
                    
                    Image(systemName: "house.fill")
                        .frame(width: 52, height: 52)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(26)
                        .offset(x: -1)
                }
            }
            
            // 2. MODERN Button tweak
            Button {
                print("This is a tweak for modern button")
            } label: {
                ZStack(alignment: .leading) {
                    Text("Modern Button")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(12)
                        .padding(.leading, 30)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.black)
                        }
                    
                    Image(systemName: "house.fill")
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(35)
                        .offset(x: -40)
                }
            }
            
            // 3. CUSTOM Effect
            Button{
                print("Custom pressed button")
            } label: {
                Text("Custom Pressed Effect")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, minHeight: 52)
            }
            .buttonStyle(ButtonPressedEffect())
            
        } //: VSTACK
        .padding()
    }
}

#Preview {
    ModernButtonView()
}

struct ButtonPressedEffect: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .secondary : .primary)
            .background(configuration.isPressed ? .secondary : .primary)
            .animation(.easeInOut, value: configuration.isPressed)
            .cornerRadius(15)
    }
}
