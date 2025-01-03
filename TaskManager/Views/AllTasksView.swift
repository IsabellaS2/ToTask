//
//  AllTasksView.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 31/10/2024.
//

import SwiftUI

struct AllTasksView: View {
    @ObservedObject var viewModel: TaskViewModel
    

    var body: some View {
        ScrollView {
            VStack {
                LogoImage()
                
                TaskCardView(viewModel: viewModel, title: "Task 1",
                             category: .school, description: "This is a task", dueDate: Date())
                .padding(.bottom, Spacing.medium)
                
                TaskCardView(viewModel: viewModel, title: "Task 2",
                             category: .work, description: "This is another task", dueDate: Date())
                Spacer()
                
                
                //testing showing task list
                if viewModel.taskList.isEmpty {
                    Text("No tasks to display")
                        .font(.custom("Gill Sans", size: Spacing.medium))
                        .foregroundColor(Color("DarkPurple"))
                } else {
                    ForEach(viewModel.taskList.indices, id: \.self) { index in
                        TaskCardView(viewModel: viewModel, title: viewModel.taskList[index].title,
                                     category: viewModel.taskList[index].category,
                                     description: viewModel.taskList[index].description,
                                     dueDate: viewModel.taskList[index].dueDate)
                    }
                }
                
                
                ForEach(viewModel.taskList, id: \.title) { task in
                    Text(task.title)
                    Text(task.description ?? "No Description")
                    Text(task.category.rawValue)
                    Text(task.dueDate, style: .date)
                }
            }
        }
        .padding(Spacing.small)
        .background(Color("Rose"))
    }
}
