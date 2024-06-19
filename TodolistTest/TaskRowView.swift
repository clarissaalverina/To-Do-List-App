//
//  TaskRowView.swift
//  TodolistTest
//
//  Created by Vincent Senjaya on 19/06/24.
//
import SwiftUI
import SwiftData

struct TaskRowView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var task: Task
//    @Binding var tasks: [Task]
    @ObservedObject var user: User
    
    var body: some View {
        HStack {
            TextField(task.title, text: $task.title)
                .foregroundColor(task.isCompleted ? .secondary : .primary)
            Button(action: {
                task.isCompleted.toggle()
                if task.isCompleted {
                    user.addXP(10)
                } else {
                    user.addXP(-10)
                }
            }) {
                Image(systemName: task.isCompleted ? "checkmark.square" : "square")
            }
        }
    }
    
//    func toggleCompletion() {
//        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
//            tasks[index].isCompleted.toggle()
//        }
//    }
    
    var filledReminderLabel: some View {
        Circle()
            .stroke(.primary, lineWidth: 2)
            .overlay(alignment: .center) {
                GeometryReader { geo in
                    VStack {
                        Circle()
                            .fill(.primary)
                            .frame(width: geo.size.width*0.7, height: geo.size.height*0.7, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
    }
    
    var emptyReminderLabel: some View {
        Circle()
            .stroke(.secondary)
    }
}


class User: ObservableObject {
    @Published var xp: Int = 0
    
    func addXP(_ amount: Int) {
        xp += amount
    }
}

//#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: Reminder.self, configurations: config)
//        let example = Reminder(name: "Reminder Example", isCompleted: false)
//        
//        return ReminderRowView(reminder: example)
//            .modelContainer(container)
//    } catch {
//        fatalError("Failed to create model container")
//    }
//}
