//
//  Task.swift
//  TodolistTest
//
//  Created by Vincent Senjaya on 19/06/24.
//

import Foundation
import SwiftData

@Model
class Task {
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
