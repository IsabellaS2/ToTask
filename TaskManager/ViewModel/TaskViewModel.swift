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
    @Published var startDate: Date = Date()

    @Published var selectedCategory: Category = .school
    @Published var isTaskComplete: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskDescription: String = ""

    var router: Router

    init(router: Router) {
        self.router = router
    }

    var dropdownOptions = Category.allCases.map { $0.rawValue }

    var task1 = Task(
        title: "Science homework",
        description: "Biology presentation on anatomy",
        startDate: Date.now,
        dueDate: Date.now.addingTimeInterval(86400),
        category: .fitness,
        isComplete: false
    )

    func emptyTaskListArray() {
        taskList.removeAll()
        print(taskList)
    }

    func addToTaskListArray() {
        let newTask = Task(
            title: taskTitle,
            description: taskDescription,
            startDate: startDate,
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

    func navigateToViewAllTasks() {
        router.navigate(to: .aboutPage)
    }

    func navigateAddTask() {
        router.navigate(to: .addTask)
    }
}
