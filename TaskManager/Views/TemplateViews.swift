//
//  TemplateViews.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 03/01/2025.
//

import SwiftUI

struct LogoImage: View {
    var body: some View {
        Image("LogoImage")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 100)
    }
}

struct AddTaskButton: View {
    let action: () -> Void
    let title: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "plus.circle")
                .font(.system(size: Spacing.large, weight: .bold))
                .foregroundColor(Color("DarkestPurple"))
            Text(title)
                .font(Font.custom("NotoSansOriya", size: Spacing.medium))
                .foregroundColor(Color("DarkestPurple"))
                .baselineOffset(-5)
        }
        .padding(Spacing.small)
        .background(Color.cPink)
        .cornerRadius(Spacing.medium)
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
                        .padding(.bottom, Spacing.micro)
                    Spacer()
                    Text(category.rawValue)
                        .font(.custom("Gill Sans", size: Spacing.standard))
                        .foregroundColor(Color("DarkPurple"))
                        .padding(.horizontal, Spacing.standard)
                        .padding(.vertical, Spacing.tiny)
                        .background(Color("CPink"))
                        .cornerRadius(Spacing.spacious)
                }
                .padding(.trailing, Spacing.small)

                Text(description ?? "")
                    .font(.custom("Gill Sans", size: Spacing.standard))
                    .foregroundColor(Color("DarkPurple"))
                    .padding(.bottom, 6.0)

                Text(dueDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.custom("Gill Sans", size: Spacing.standard))
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
        .padding(.top, Spacing.small)
        .background(Color("Cream"))
        .overlay(
            RoundedRectangle(cornerRadius: Spacing.small)
                .stroke(Color("Purple3"), lineWidth: 1)
        )
    }
}


