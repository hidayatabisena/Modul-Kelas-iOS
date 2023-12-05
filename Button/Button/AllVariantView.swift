//
//  AllVariantView.swift
//  Button
//
//  Created by Hidayat Abisena on 05/12/23.
//

import SwiftUI

struct AllVariantView: View {
    @State var isActive = false
    
    var body: some View {
        VStack(spacing: 12) {
            // 1. FILL Button
            Button {
                print("You are awesome iOS Developer")
            } label: {
                Text("Fill Button")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, minHeight: 52)
                    .background(.black)
                    .cornerRadius(15)
            }
            
            // 2. Border Button
            Button {
                print("You are amazing iOS Developer")
            } label: {
                Text("Border Button")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, minHeight: 52)
                    .cornerRadius(15)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black)
                    }
            }
            
            HStack(spacing: 8) {
                // 3. ICON Button
                Button {
                    print("You made my day")
                } label: {
                    Image(systemName: "house.fill")
                        .frame(width: 52, height: 52)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(15)
                }
                
                // 4. CIRCLE Icon Button
                Button {
                    print("All is Well")
                } label: {
                    Image(systemName: "house.fill")
                        .frame(width: 52, height: 52)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(26)
                }
            }
            
            // 5. TEXT with Image Icon Button
            Button(action: {
                print("Everythings gonna be OKAY!")
            }, label: {
                HStack {
                    Image(systemName: "house.fill")
                    Text("Button With Icon")
                }
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity, minHeight: 52)
                .background(.black)
                .cornerRadius(15)
            })
            
            // 6. LINK Button
            Button(action: {
                print("You only live twice")
            }, label: {
                Text("Fill Button")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, minHeight: 52)
                    .underline(true)
            })
            
            HStack {
                // 7. LINK Button
                Button(action: {
                    print("The more you give, the more you receive!")
                }, label: {
                    VStack(spacing: 2) {
                        Image(systemName: "house.fill")
                            .frame(width: 52, height: 52)
                            .foregroundColor(.white)
                            .background(.black)
                            .cornerRadius(15)
                        Text("Caption Button")
                            .font(.system(size: 12, weight: .semibold))
                            .frame(width: 80)
                    }
                })
                
                // 8. TOGGLE Icon Button
                VStack {
                    Image(systemName: "house.fill")
                        .frame(width: 52, height: 52)
                        .foregroundColor(isActive ? .white : .black)
                        .background(isActive ? .black : .clear)
                        .cornerRadius(15)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black)
                        }
                        .onTapGesture {
                            withAnimation {
                                isActive.toggle()
                            }
                        }
                    
                    // 9. TEXT wrapped Button
                    Button{
                        print("You are what you eat!")
                    } label: {
                        Text("Text Wrapped Button")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                            .background(.black)
                            .cornerRadius(15)
                    }
                }
            }
            
            // 10. DASHED Icon Button
            Group {
                Button {
                    print("The world is not enough!")
                } label: {
                    Image(systemName: "house.fill")
                        .frame(width: 52, height: 52)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [8]))
                            
                        }
                }
            }
            .padding([.top, .bottom])
            
            
        }
        .padding()
    }
}

#Preview {
    AllVariantView()
}
