//
//  TodoViewModel.swift
//  todolist
//
//  Created by Marsa Technologies on 28/8/23.
//

import Foundation


class TodoViewModel : ObservableObject {
    
    @Published var items : [TodoItem] = [] {
        didSet {
            saveItems()
        }
    }
    
    let userDefaultsKey = "todoItems"
    
    init(){
        getItems()
    }
    
    func getItems(){
//        items.append(contentsOf: [
//            TodoItem(title: "First Item", isCompleted: false),
//            TodoItem(title: "Second Item", isCompleted: false),
//            TodoItem(title: "Third Item", isCompleted: false),
//        ])
        guard
            let data = UserDefaults.standard.data(forKey: userDefaultsKey),
            let decodedData = try? JSONDecoder().decode([TodoItem].self, from: data)
        else {return}
        items = decodedData
    }
    
    func deleteItem(indexSet : IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from : IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        items.append(TodoItem(title: title, isCompleted: false))
    }
    
    func updateItem(item: TodoItem){
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        guard let encodedData = try? JSONEncoder().encode(items) else {return}
        UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
    }
}
