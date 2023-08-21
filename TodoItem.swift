//
//  TodoItem.swift
//  ToDoey
//
//  Created by Chase Allen on 8/19/23.
//

import Foundation

struct ToDoItem: Identifiable {
    var id = UUID()
    var text: String
    var isDone: Bool
}
