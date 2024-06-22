//
//  ContentView.swift
//  TodolistTest
//
//  Created by Clarissa Alverina on 17/06/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @State private var tasks: [Task] = []
    @State private var newTaskTitle: String = ""
    @Query var tasks: [Task]
    @State private var path = [Task]()
    @Environment(\.modelContext) var modelContext
    @ObservedObject var user: User
    
    var body: some View {
        VStack{
//            VStack {
//                Text("To-Do List")
//                    .bold()
//                .font(.system(size: 30))
//            }
//            .padding(.trailing, 200)
//            .padding(.top, 10)
            
            NavigationStack(path: $path) {
                List {
                    ForEach(tasks) { task in
                        TaskRowView(task: task, user: user)
                    }
                    .onDelete(perform: deleteTask)
                }
                
    //            .navigationDestination(for: Task.self) { task in
    //                EditTaskView(task: task)
    //            }
//                .toolbar {
//                    Button("Add Task", systemImage: "plus", action: addTask)
//                }
            }
            .padding(.bottom, 30)
            
            Button("Add Task", systemImage: "plus", action: addTask)
            
//            VStack {
//                Button(action: {
//                    
//                }) {
//                    ZStack {
//                        Circle()
//                            .frame(width: 60, height: 60)
//                            .foregroundColor(.gray)
//                        Image(systemName: "plus")
//                            .foregroundColor(.white)
//                            .font(.system(size: 24))
//                    }
//                }
//            }

        }
        
    }
    func addTask() {
        let task = Task(title: "", isCompleted: false)
        modelContext.insert(task)
//        path.append(task)
    }
    func deleteTask(at offsets: IndexSet) {
        for offset in offsets {
            let task = tasks[offset]
            modelContext.delete(task)
        }
    }
}
//    func addNewTask() {
//        guard !newTaskTitle.isEmpty else { return }
//        let newTask = Task(id: UUID(), title: newTaskTitle, isCompleted: false)
//        tasks.append(newTask)
//        newTaskTitle = ""
//    }
//
//    func deleteTask(at offsets: IndexSet) {
//        tasks.remove(atOffsets: offsets)
//    }

//        NavigationView {
//            VStack {
//                HStack {
//                    TextField("Enter new task", text: $newTaskTitle)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                    Button(action: {
//                        addNewTask()
//                    }) {
//                        ZStack {
//                            Rectangle()
//                                .frame(width: 100, height: 30)
//                                .cornerRadius(25)
//                                .foregroundColor(.black)
//
//                            Text("Add")
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color.white)
//                                .font(.system(size: 16))
//                        } .padding(.trailing, 10)
//                    }
//                } .padding(.top, 30)
//                List {
//                    ForEach(tasks) { task in
//                        TaskRow(task: task, tasks: $tasks)
//                    }
//                    .onDelete(perform: deleteTask)
//                }
//                .navigationBarItems(leading: Text("To-Do List").padding(.top, 20).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/) .font(.system(size: 30)))
//                .navigationBarItems(trailing: EditButton())
//            }
//        }

#Preview {
    ContentView(user: User())
}
