//
//  ContentView.swift
//  List
//
//  Created by Hidayat Abisena on 03/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(NSLocale.isoCountryCodes, id: \.self) { countryCode in
            HStack {
                Text(countryFlag(in: countryCode))
                Text(Locale.current.localizedString(forRegionCode: countryCode) ?? "")
                Spacer()
                Text(countryCode)
            }
        }
    }
    
    func countryFlag(in countryCode: String) -> String {
        String(String.UnicodeScalarView(countryCode.unicodeScalars.compactMap {
            UnicodeScalar(127397 + $0.value)
        }))
    }
}

#Preview {
    ContentView()
}
