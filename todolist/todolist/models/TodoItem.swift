//
//  TodoItem.swift
//  todolist
//
//  Created by Marsa Technologies on 28/8/23.
//

import Foundation


struct TodoItem : Identifiable, Codable {
    let id : String
    let title : String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString, title : String, isCompleted : Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TodoItem {
        return TodoItem(id: id, title: title, isCompleted: !isCompleted)
    }
}
