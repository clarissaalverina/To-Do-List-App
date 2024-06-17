//
//  ContentView.swift
//  TodolistTest
//
//  Created by Clarissa Alverina on 17/06/24.
//

import SwiftUI


struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var newTaskTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter new task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button(action: {
                        addNewTask()
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 100, height: 30)
                                .cornerRadius(25)
                                .foregroundColor(.black)
                            
                            Text("Add")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16))
                        } .padding(.trailing, 10)
                    }
                } .padding(.top, 30)
                List {
                    ForEach(tasks) { task in
                        TaskRow(task: task, tasks: $tasks)
                    }
                    .onDelete(perform: deleteTask)
                }
                .navigationBarItems(leading: Text("To-Do List").padding(.top, 20).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/) .font(.system(size: 30)))
                .navigationBarItems(trailing: EditButton())
            }
        }
    }

    func addNewTask() {
        guard !newTaskTitle.isEmpty else { return }
        let newTask = Task(id: UUID(), title: newTaskTitle, isCompleted: false)
        tasks.append(newTask)
        newTaskTitle = ""
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct TaskRow: View {
    var task: Task
    @Binding var tasks: [Task]

    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            Button(action: {
                toggleCompletion()
            }) {
                Image(systemName: task.isCompleted ? "checkmark.square" : "square")
            }
        }
    }

    func toggleCompletion() {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}

struct Task: Identifiable {
    let id: UUID
    var title: String
    var isCompleted: Bool
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
