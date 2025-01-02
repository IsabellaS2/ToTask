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
                //                if !task.isComplete {
                TaskCardView(viewModel: viewModel, title: "Task 1",
                             category: .school, description: "This is a task", dueDate: Date())
                //                }
                Spacer()
            }
        }
        .padding(10.0)
        .background(Color("Cream"))
    }

}

struct TaskCardView: View {
    @ObservedObject var viewModel: TaskViewModel
    let title: String
    let category: Category
    let description: String?
    let dueDate: Date
    //    var isComplete: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.custom("Gill Sans", size: Spacing.medium))
                        .foregroundColor(Color("DarkPurple"))
                        .padding(.bottom, 4)
                    Spacer()
                    Text(category.rawValue)
                        .font(.custom("Gill Sans", size: Spacing.small))
                        .foregroundColor(Color("DarkPurple"))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color("CPink"))
                        .cornerRadius(25)
                }
                .padding(.trailing, Spacing.small)

                Text(description ?? "")
                    .font(.custom("Gill Sans", size: Spacing.standard))
                    .foregroundColor(Color("DarkPurple"))
                    .padding(.bottom, 6.0)

                Text(dueDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.custom("Gill Sans", size: 13))
                    .foregroundColor(Color("DarkPurple"))
                    .padding(.bottom, Spacing.small)

                HStack {
                    // complete button
                    Button {
                        viewModel.navigateAddTask()
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: Spacing.medium, weight: .bold))
                            .foregroundColor(Color("CPink"))
                        Text("Complete?")
                            .font(.custom("Gill Sans", size: Spacing.standard))
                            .foregroundColor(Color("DarkPurple"))
                    }
                    Spacer()

                    // update button
                    Button {
                        viewModel.navigateAddTask()
                    } label: {
                        Image(systemName: "pencil.circle")
                            .font(.system(size: Spacing.medium, weight: .bold))
                            .foregroundColor(Color("CPink"))
                        Text("Update?")
                            .font(.custom("Gill Sans", size: Spacing.standard))
                            .foregroundColor(Color("DarkPurple"))
                    }
                }
                .padding([.bottom, .trailing], Spacing.standard)

            }
            .padding(.leading, Spacing.standard)
            Spacer()

        }
        .padding(.top, 10.0)
        .background(Color("Cream"))
        .overlay(
            RoundedRectangle(cornerRadius: Spacing.small)
                .stroke(Color("Purple3"), lineWidth: 1)
        )
    }
}
