//
//  EditTaskView.swift
//  TodolistTest
//
//  Created by Vincent Senjaya on 19/06/24.
//

import SwiftUI

struct EditTaskView: View {
    @Bindable var task: Task
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $task.title)
                    .textContentType(.name)

//                TextField("Email address", text: $task.isCompleted)
//                    .textContentType(.emailAddress)
//                    .textInputAutocapitalization(.never)
            }
        }
    }
}

//#Preview {
//    EditTaskView()
//}
