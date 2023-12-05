//
//  CheckmarkView.swift
//  Button
//
//  Created by Hidayat Abisena on 05/12/23.
//

import SwiftUI

struct CheckmarkView: View {
    @State private var isActive: Bool = false
    @State private var isActiveRadio: Bool = false
    @State private var isActiveCheckmark: Bool = false
    
    var body: some View {
        VStack(spacing: 24) {
            // 1. RADIO Button
            HStack(spacing: 12) {
                Circle()
                    .fill(.black.opacity(isActiveRadio ? 1 : 0))
                    .frame(width: 14, height: 14)
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                            .frame(width: 20, height: 20)
                    }
                
                Text("Radio Button ")
            }
            .onTapGesture {
                withAnimation {
                    isActiveRadio.toggle()
                }
            }
            
            // 2. CHECKMARK Button
            HStack(spacing: 12) {
                Image(systemName: isActiveCheckmark ? "checkmark.square.fill" : "")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .cornerRadius(2)
                    .overlay {
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(.black)
                            .frame(width: 18, height: 18)
                    }
                
                Text("Checkmark Button ")
            }
            .onTapGesture {
                withAnimation {
                    isActiveCheckmark.toggle()
                }
            }
            
            // 3. MODERN CHECKMARK Button
            HStack(spacing: 12) {
                Text("Full Width Checkmark")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(isActive ? .white : .black)
                
                Spacer()
                
                Image(systemName: isActive ? "checkmark.circle.fill" : "")
                    .resizable()
                    .foregroundColor(isActive ? .white : .black)
                    .frame(width: 24, height: 24)
                    .overlay {
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(isActive ? .white : .black)
                    }
            }
            .padding(.horizontal, 16)
            .frame(height: 52)
            .background(isActive ? .black : .white)
            .cornerRadius(15)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.black)
            }
            .onTapGesture {
                withAnimation {
                    isActive.toggle()
                }
            }
        }
        .padding()
    }
}

#Preview {
    CheckmarkView()
}
