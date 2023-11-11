//
//  ContentView.swift
//  TabView
//
//  Created by Hidayat Abisena on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Explore")
                .tabItem {
                    Label("Explore", systemImage: "network")
                }
            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            Text("Notification")
                .tabItem {
                    Label("Notification", systemImage: "bell")
                }
            // The following tabs will be grouped under the More tab.
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
            Text("Extra 1")
                .tabItem {
                    Label("Extra 1", systemImage: "1.circle")
                }
            Text("Extra 2")
                .tabItem {
                    Label("Extra 2", systemImage: "2.circle")
                }
            Text("Extra 3")
                .tabItem {
                    Label("Extra 3", systemImage: "3.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
