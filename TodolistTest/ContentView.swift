//
//  ContentView.swift
//  TodolistTest
//
//  Created by Clarissa Alverina on 17/06/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var newTaskTitle: String = ""
    @Query var tasks: [Task]
    @State private var path = [Task]()
    @Environment(\.modelContext) var modelContext
    
    @Binding var currentExp : Int
    @Binding var currentLevel : Int
    @Binding var completedTask : Int
    
    //testbro
    var body: some View {
        VStack{
            NavigationStack(path: $path) {
                List {
                    ForEach(tasks) { task in
                        TaskRowView(task: task, currentExp: $currentExp, currentLevel: $currentLevel, completedTask: $completedTask)
                    }
                    .onDelete(perform: deleteTask)
                }
                .navigationTitle("To-Do")
                .navigationDestination(for: Task.self, destination: EditTaskView.init)
                .toolbar {
                    Button("Add Task", systemImage: "plus", action: addTask)
                }
            }
            Button("Add Task", systemImage: "plus", action: addTask)
            Button("Reset", systemImage: "minus", action: resetSwiftData)
        }
        
    }
//    func addTask() {
//        let task = Task(title: "", isCompleted: false, details: "", date: "", priority: 2)
//        modelContext.insert(task)
////        path.append(task)
//    }
    
    func addTask(){
        let task = Task()
        modelContext.insert(task)
        path = [task]
    }
    
    func deleteTask(at offsets: IndexSet) {
        for offset in offsets {
            let task = tasks[offset]
            modelContext.delete(task)
        }
    }
    func resetSwiftData(){
        do {
            try modelContext.delete(model: Task.self)
        } catch {
            print("Failed to clear all data.")
        }
    }
}

