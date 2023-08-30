//
//  ListView.swift
//  todolist
//
//  Created by Marsa Technologies on 28/8/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var todoVM : TodoViewModel

    var body: some View {
        ZStack{
            if(todoVM.items.isEmpty){
                NoTodoItemsView()
                    .transition(.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(todoVM.items, content: { item in
                        ListItemView(item: item)
                            .onTapGesture{
                                withAnimation(.easeIn){
                                    todoVM.updateItem(item: item)
                                }
                            }
                    })
                    .onDelete(perform: todoVM.deleteItem)
                    .onMove(perform: todoVM.moveItem)
                }
                .listStyle(PlainListStyle())
            }
            
        }
        .navigationTitle("TodoList")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: CreateTodoView()))
        
    }
    

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                ListView()
            }
            .environmentObject(TodoViewModel())
            
        }
    }
}
