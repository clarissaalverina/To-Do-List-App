//
//  CreateListView.swift
//  TodolistTest
//
//  Created by Clarissa Alverina on 19/06/24.
//

//import SwiftUI
//
//struct CreateListView: View {
//    @State private var newTaskTitle: String = ""
//    @Query var tasks: [Task]
//    @State private var path = [Task]()
//    @Environment(\.modelContext) var modelContext
//    @ObservedObject var user: User
//    
//    var body: some View {
//        Text("Create To-Do List")
//        Text("Input Task")
//        TextField("Enter new task", text: $newTaskTitle)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding()
//        Button(action: {
//            addTask()
//        }) {
//            ZStack {
//                Rectangle()
//                    .frame(width: 100, height: 30)
//                    .cornerRadius(25)
//                    .foregroundColor(.black)
//                
//                Text("Add")
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color.white)
//                    .font(.system(size: 16))
//            } .padding(.trailing, 10)
//        }
//        
//    }
//}
//
//#Preview {
//    CreateListView()
//}
