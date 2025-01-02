//
//  AboutPageView.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 02/07/2024.
//

import SwiftUI

struct AboutPageView: View {
    @ObservedObject var viewModel: TaskViewModel

    var body: some View {
        VStack {
            HStack {
                Image("LogoImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
            }
            .padding(.top)

            Text("This is ToTask!")
                .modifier(TextStyles.descriptionStyle())

            Text("An app which allows you to easily add, update, delete and view your tasks")
                .modifier(TextStyles.descriptionStyle())
                .multilineTextAlignment(.center)

            VStack {
                Text("\u{2022} **Time Tracking**: Set due dates to easily monitor task progress.")
                    .modifier(TextStyles.bulletPointStyle())
                    .multilineTextAlignment(.center)

                Text("""
                \u{2022} **Organised Categories**: Categorise tasks \
                for effortless organisation and quick access.
                """)
                    .modifier(TextStyles.bulletPointStyle())
                    .multilineTextAlignment(.center)

                Text("\u{2022} **Daily Overview**: Instantly view all tasks due today on your homepage.")
                    .modifier(TextStyles.bulletPointStyle())
                    .multilineTextAlignment(.center)
            }
            .padding(.top)

            Spacer()

            Text("Start Today and Add A Task!")
                .multilineTextAlignment(.center)
                .modifier(TextStyles.descriptionStyle())

            Spacer()

            HStack {
                // View All Tasks Button
                Button {
                    viewModel.navigateAddTask()
                } label: {
                    Text("View All Tasks")
                        .font(Font.custom("NotoSansOriya", size: Spacing.medium))
                        .foregroundColor(Color.cPink)
                        .padding(Spacing.standard)
                        .background(Color("DarkestPurple"))
                        .cornerRadius(Spacing.medium)
                }

                Spacer()

                // Add Task Button
                Button {
                    viewModel.navigateAddTask()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: Spacing.large, weight: .bold))
                        .foregroundColor(Color("DarkestPurple"))
                    Text("Add Task")
                        .font(Font.custom("NotoSansOriya", size: Spacing.medium))
                        .foregroundColor(Color("DarkestPurple"))
                        .baselineOffset(-5)
                }
                .padding(12.0)
                .background(Color.cPink)
                .cornerRadius(Spacing.medium)
            }
            .padding(.horizontal, 20.0)
            .padding(.bottom, 20.0)

        }
        .padding(10.0)
        .background(Color("Rose"))

    }
}

// #Preview {
//    AboutPageView()
// }
