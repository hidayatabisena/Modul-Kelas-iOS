//
//  HidesBottomBar.swift
//  TabView
//
//  Created by Hidayat Abisena on 11/11/23.
//

import SwiftUI

struct HidesBottomBar: View {
    @State private var selection = 0
    @State private var shouldShowTabBar = true
    
    var body: some View {
        VStack {
            if shouldShowTabBar {
                TabView(selection: $selection){
                    Text("First Car")
                        .tabItem { Label("First car", systemImage: "car") }
                        .tag(0)
                    
                    NavigationStack {
                        VStack {
                            Text("Second View")
                            Button("Push View") {
                                shouldShowTabBar = false
                            }
                            .background(
                                NavigationLink(
                                    destination:
                                                
                                        ThirdView(showTabBar: $shouldShowTabBar),
                                               isActive: .constant(!shouldShowTabBar)) {
                                                   EmptyView()
                                               }
                            )
                        }
                    }
                    .tabItem { Label("Network", systemImage: "network") }
                    .tag(1)
                }
            } else {
                NavigationStack {
                    ThirdView(showTabBar: $shouldShowTabBar)
                }
            }
        }
    }
}

#Preview {
    HidesBottomBar()
}

struct ThirdView: View {
    @Binding var showTabBar: Bool
    
    var body: some View {
        VStack {
            Text("Third View, without TabBar")
            Button("Pop View") {
                showTabBar = true
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
