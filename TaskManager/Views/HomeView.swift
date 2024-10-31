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
            //Logo
            Image("LogoImage")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 100)
            
            //Welcome Text
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
                
                //Card
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(viewModel.task1.title)
                                .font(.custom("Gill Sans", size: Spacing.medium))
                                .foregroundColor(Color("DarkPurple"))
                                .padding(.bottom, 4)
                            Spacer()
                            Text(viewModel.task1.category.rawValue)
                                .font(.custom("Gill Sans", size: Spacing.small))
                                .foregroundColor(Color("DarkPurple"))
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color("CPink"))
                                .cornerRadius(25)
                        }
                        .padding(.trailing, Spacing.small)
                        
                        Text(viewModel.task1.description ?? "")
                            .font(.custom("Gill Sans", size: Spacing.standard))
                            .foregroundColor(Color("DarkPurple"))
                            .padding(.bottom, 6.0)
                        
                        Text(viewModel.task1.dueDate.formatted(date: .abbreviated, time: .omitted))
                            .font(.custom("Gill Sans", size: 13))
                            .foregroundColor(Color("DarkPurple"))
                            .padding(.bottom, Spacing.small)
                        
                        HStack {
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
                
                Spacer()
                
                //Buttons
                HStack {
                    // View All Tasks Button
                    Button("View All Tasks") {
                        viewModel.navigateToViewAllTasks()
                    }
                    .font(Font.custom("NotoSansOriya", size: Spacing.medium))
                    .foregroundColor(Color.cPink)
                    .padding(Spacing.standard)
                    .background(Color("DarkestPurple"))
                    .cornerRadius(Spacing.medium)
                    
                    Spacer()
                                    
                    //Add Task Button
                    Button {
                        router.navigate(to: .addTask)
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
                Spacer()
            }
        }
        .padding(15)
        .background(Color("Rose"))
        Spacer()
    }
}

//#Preview {
//    HomeView()
//}
