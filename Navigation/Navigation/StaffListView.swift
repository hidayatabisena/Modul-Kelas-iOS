//
//  StaffListView.swift
//  Navigation
//
//  Created by Hidayat Abisena on 21/11/23.
//

import SwiftUI

struct StaffListView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(staff) { staff in
                    NavigationLink(destination: PersonDetailView(staff: staff)) {
                        PersonRowView(staff: staff)
                    }
                }
            }
            .navigationTitle("Staff List")
        }
    }
}

#Preview {
    StaffListView()
}

struct Staff: Identifiable {
    let id = UUID()
    var name: String
    var phoneNumber: String
    var email: String
    var address: String
}

var staff = [
    Staff(name: "Juan Chavez", phoneNumber: "(408) 555-4301", email: "juan.chavez@example.com", address: "123 Main Street, San Jose, CA"),
    Staff(name: "Mei Chen", phoneNumber: "(919) 555-2481", email: "mei.chen@example.com", address: "456 Elm Avenue, Raleigh, NC")
]

struct PersonRowView: View {
    var staff: Staff
    
    var body: some View {
        HStack {
            Text(staff.name)
            Spacer()
            Text(staff.phoneNumber)
        }
    }
}

struct PersonDetailView: View {
    var staff: Staff
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(staff.name)
                    .font(.largeTitle)
                Text(staff.email)
                    .font(.subheadline)
                Text(staff.address)
                    .font(.subheadline)
            }
            .padding()
            .toolbarBackground(.hidden, for: .navigationBar)
        } // add this modifier
    }
}
