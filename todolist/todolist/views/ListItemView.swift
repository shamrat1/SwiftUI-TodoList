//
//  ListItemView.swift
//  todolist
//
//  Created by Marsa Technologies on 28/8/23.
//

import SwiftUI

struct ListItemView: View {
    let item : TodoItem
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ListItemView(item: TodoItem(title: "Item Name", isCompleted: false))
            ListItemView(item: TodoItem(title: "Item Name", isCompleted: true))
        }
    }
        
}
