//
//  HomeView.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 10/09/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: TaskViewModel
    @EnvironmentObject var router: Router

    var body: some View {
        VStack {
            LogoImage()

            // Welcome Text
            VStack(alignment: .leading) {
                Text("Hi, Welcome Back!")
                    .font(.custom("Gill Sans", size: Spacing.extensive))
                    .foregroundColor(Color("DarkPurple"))
                    .padding(.bottom, Spacing.small)

                Text("Tasks for Today")
                    .font(.custom("Gill Sans", size: Spacing.large))
                    .foregroundColor(Color("DarkPurple"))
                    .padding(.bottom, Spacing.micro)

                Text(Date().formatted(date: .complete, time: .omitted))
                    .font(.custom("Gill Sans", size: Spacing.medium))
                    .foregroundColor(Color("DarkPurple"))

                Spacer()

                // Card
                TaskCardView(viewModel: viewModel, title: viewModel.task1.title,
                             category: viewModel.task1.category, description: viewModel.task1.description,
                             dueDate: viewModel.task1.dueDate)

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

                Spacer()

                // Buttons
                HStack {
                    // View All Tasks Button
                    Button("View All Tasks") {
                        router.navigate(to: .allTasks)
                    }
                    .font(Font.custom("NotoSansOriya", size: Spacing.medium))
                    .foregroundColor(Color.cPink)
                    .padding(Spacing.standard)
                    .background(Color("DarkestPurple"))
                    .cornerRadius(Spacing.medium)

                    Spacer()

                    // Add Task Button
                    AddTaskButton(action: viewModel.navigateAddTask, title: "Add Task")

                }
                // about page button
                Button("About Page") {
                    router.navigate(to: .aboutPage)
                }
                Spacer()
            }
            Spacer()
        }
        .padding(Spacing.standard)
        .background(Color("Rose"))
        .onAppear {
            print("HomeView appeared, task list count: \(viewModel.taskList.count)")
        }
    }

}
