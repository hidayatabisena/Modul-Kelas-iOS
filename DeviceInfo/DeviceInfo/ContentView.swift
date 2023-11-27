//
//  ContentView.swift
//  DeviceInfo
//
//  Created by Hidayat Abisena on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let device = UIDevice.current
        let deviceName = device.name
        let deviceModel = device.model
        let systemName = device.systemName
        let systemVersion = device.systemVersion
        let identifier = device.identifierForVendor?.uuidString ?? "N/A"
        let deviceType = UIDevice.current.userInterfaceIdiom
        
        DeviceInformationView(
            deviceName: deviceName,
            deviceModel: deviceModel,
            systemName: systemName,
            systemVersion: systemVersion,
            identifier: identifier,
            deviceType: deviceType
        )
    }
}

#Preview {
    ContentView()
}

struct DeviceInformationView: View {
    let deviceName: String
    let deviceModel: String
    let systemName: String
    let systemVersion: String
    let identifier: String
    let deviceType: UIUserInterfaceIdiom
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Device Name: \(deviceName)")
            Text("Device Model: \(deviceModel)")
            Text("System Name: \(systemName)")
            Text("System Version: \(systemVersion)")
            Text("Device Identifier: \(identifier)")
            Text("Device Type: \(deviceType == .phone ? "iPhone" : "iPad")")
        }
        .padding()
    }
}
