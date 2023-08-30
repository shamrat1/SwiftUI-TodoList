//
//  CreateTodoView.swift
//  todolist
//
//  Created by Marsa Technologies on 28/8/23.
//

import SwiftUI

struct CreateTodoView: View {
    @EnvironmentObject var todoVM : TodoViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var todoText : String = ""
    @State var showAlert : Bool = false
    @State var alertText : String = ""
    
    var body: some View {
        GeometryReader { gr in
            ScrollView{
                VStack{
                    TextField("Enter your Todo here..", text: $todoText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(UIColor.systemFill))
                    .cornerRadius(10)
                    
                    Spacer(minLength: gr.size.height * 0.75)
                    
                    Button("Save".uppercased(), action: saveItem)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        
                }.padding(16)
            }
            .frame(height: gr.size.height)
            .navigationTitle("Add New Todo")
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertText))
            }
        }
 
    }
    
    func saveItem() {
        if(todoText.isEmpty){
            alertText = "Todo can't be empty."
            showAlert.toggle()
        }else{
            todoVM.addItem(title: todoText)
            presentationMode.wrappedValue.dismiss()
        }

    }
}

struct CreateTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CreateTodoView()
        }
        .environmentObject(TodoViewModel())
    }
}
