//
//  NoTodoItemsView.swift
//  todolist
//
//  Created by Marsa Technologies on 28/8/23.
//

import SwiftUI

struct NoTodoItemsView: View {
    @State var animate : Bool = false
    let secondaryColor = Color("SecondaryColor")
    var body: some View {
        VStack(spacing: 10){
            Text("No Items Found")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Add new items in your Todo list and become productive.")
                .font(.headline)
                .padding(.bottom, 15)
            
            NavigationLink(destination: CreateTodoView(), label: {
                Text("🎉 Add Todo 🎉")
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? secondaryColor : Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding(.horizontal,animate ? 30 : 50)
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? -10 : 0)
            .shadow(color: animate ? secondaryColor.opacity(0.6) : Color.accentColor.opacity(0.6), radius: 10, y: animate ? 50 : 30)
            
        }.padding(50)
        .frame(alignment: .center)
        .multilineTextAlignment(.center)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(Animation.easeInOut(duration: 2.0)
                .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct NoTodoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoTodoItemsView()
        }
        .previewLayout(.sizeThatFits)
    }
}
