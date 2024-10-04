//
//  TaskModel.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 13/09/2024.
//

import Foundation

//struct TaskModel  {
//    var id: UUID = UUID()
//    var title: String
//    var description: String?
//    
//    var startDate: Date
//    var dueDate: Date
//    
//    var category: Category
//    var isCompleted: Bool
//    

//}

enum Category: String, CaseIterable {
        case school = "School"
        case work = "Work"
        case personal = "Personal"
        case fitness = "Fitness"
    }

struct Task {
    let title: String
    let description: String?
    let startDate: Date

    let dueDate: Date
    let category: Category
    var isComplete: Bool
}
