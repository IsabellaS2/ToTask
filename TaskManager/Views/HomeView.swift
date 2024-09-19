//
//  HomeView.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 10/09/2024.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = TaskViewModel()
    
    var body: some View {
        VStack {
            Image("LogoImage")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 100)
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
                            Text(viewModel.task1.category)
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
                            NavigationLink {
                                AddTaskView()
                            } label: {
                                Image(systemName: "checkmark.circle")
                                    .font(.system(size: Spacing.medium, weight: .bold))
                                    .foregroundColor(Color("CPink"))
                                Text("Complete?")
                                    .font(.custom("Gill Sans", size: Spacing.standard))
                                    .foregroundColor(Color("DarkPurple"))
                            }
                            Spacer()
                            
                            NavigationLink {
                                AddTaskView()
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
            }
        }
        .padding(15)
        .background(Color("Rose"))
        Spacer()
    }
    
}

#Preview {
    HomeView()
}
