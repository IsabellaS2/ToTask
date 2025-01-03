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
            }
        }
        .padding(Spacing.small)
        .background(Color("Rose"))
    }
}
