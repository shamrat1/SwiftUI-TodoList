//
//  todolistApp.swift
//  todolist
//
//  Created by Marsa Technologies on 26/8/23.
//

import SwiftUI

@main
struct todolistApp: App {
    @StateObject var todoVM : TodoViewModel = TodoViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(todoVM)
        }
    }
}


