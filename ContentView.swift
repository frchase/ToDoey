//
//  ContentView.swift
//  ToDoey
//
//  Created by Chase Allen on 10/27/22.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks = [ToDoItem]()
    @State private var isClicked = false
    @State private var count = 0
    @State var defText: String = ""
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        TextField("Enter a Task" , text: $defText)
                            .modifier(TextFieldClearButton(text: $defText))
                            .multilineTextAlignment(.leading)
                            .onSubmit {
                                tasks.append(ToDoItem(text: defText, isDone: false))
                            }
                        }
                    }
                    Section {
                        TaskView(tasks: $tasks)
                    } header: {
                        Text("tasks")
                    }
                }
                .navigationTitle("ToDoey")
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
