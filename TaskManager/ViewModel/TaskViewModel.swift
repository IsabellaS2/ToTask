//
//  SwiftUIView.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 16/08/2024.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    
    
    @Published var taskList: [Task] = []
    
    @Published var selectedDate: Date = Date()
    @Published var selectedCategory: String = "School"
    @Published var isTaskComplete: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskDescription: String = ""
    
    
    var dropdownOptions = ["School", "Work", "Personal", "Fitness"]
    
    func emptyTaskListArray() {
        taskList.removeAll()
        print(taskList)
    }
    
    func addToTaskListArray() {
        let newTask = Task(
            title: taskTitle,
            description: taskDescription,
            dueDate: selectedDate,
            category: selectedCategory,
            isComplete: isTaskComplete
        )
        taskList.append(newTask)
        print(taskList)
    }
    
    func handleButtonToggle() {
        isTaskComplete.toggle()
        
    }
}


//@Published var message: String = ""

//check if tasks array is empty
//if it is then
//message =
