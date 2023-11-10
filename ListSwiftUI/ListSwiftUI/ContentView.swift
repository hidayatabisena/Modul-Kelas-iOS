//
//  ContentView.swift
//  ListSwiftUI
//
//  Created by Hidayat Abisena on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var multiSelection = Set<UUID>()
    
    @State private var todayTodos: [TodoItem] = [
        .init(title: "Exercise 30 mins"),
        .init(title: "Read one Article"),
        .init(title: "Research SwiftUI")
    ]
    
    @State private var tommorowTodos: [TodoItem] = [
        .init(title: "Make a new friend"),
        .init(title: "Study English"),
        .init(title: "Research UIKit")
    ]
    
    var body: some View {
        NavigationStack {
            List(selection: $multiSelection) {
                Section {
                    ForEach(todayTodos, id: \.id) { todo in
                        Text(todo.title)
                    }
                    .onDelete(perform: { indexSet in
                        todayTodos.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        todayTodos.move(fromOffsets: indices, toOffset: newOffset)
                    })
                } header: {
                    Text(Date().formatted(date: .abbreviated, time: .omitted))
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                } footer: {
                    Text("To do List")
                }
                
                Section {
                    ForEach(tommorowTodos, id: \.id) { todo in
                        Text(todo.title)
                    }
                    .onDelete(perform: { indexSet in
                        tommorowTodos.remove(atOffsets: indexSet)
                    })
                } header: {
                    Text("Tommorow")
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                } footer: {
                    Text("Consistence is the key")
                }
            }
            //.listStyle(PlainListStyle())
            .navigationTitle("Todo List")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            })
            .refreshable {
                var copyToday = todayTodos
                var copyTommorow = tommorowTodos
                copyToday.append(.init(title: "Complete all task at work"))
                copyTommorow.append(.init(title: "Draw a flower"))
                todayTodos.removeAll()
                tommorowTodos.removeAll()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    todayTodos = copyToday
                    tommorowTodos = copyTommorow
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct TodoItem: Identifiable {
    let id: UUID = .init()
    var title: String
}
