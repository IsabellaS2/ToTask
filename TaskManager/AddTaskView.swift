//  ContentView.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 13/02/2024.

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel = TaskViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                //Image and back arrow
                HStack {
                    Image(systemName: "arrow.left")
                        .font(.system(size: Spacing.big, weight: .bold))
                        .foregroundColor(Color("Purple2"))
                    
                    Image("LogoImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100)
                }
                .padding(.top)
                
                
                //Entered text section
                VStack(alignment: .leading) {
                    TextField("Current Task Name", text: $viewModel.taskTitle)
                        .font(.custom("NotoSansOriya", size: Spacing.large))
                        .foregroundColor(Color("DarkPurple"))
                    
                    TextField("Task Description", text: $viewModel.taskDescription)
                        .font(.custom("NotoSansOriya", size: Spacing.spacious))
                        .foregroundColor(Color("DarkPurple"))
                }
                .padding(Spacing.spacious)
                
                
                //Due date and category
                VStack(alignment: .center, spacing: 30) {
                    DatePicker("Due Date", selection: $viewModel.selectedDate, displayedComponents: .date)
                        .foregroundColor(Color("DarkPurple"))
                        .font(.custom("NotoSansOriya", size: Spacing.considerable))
                    
                    
                    HStack {
                        Section(header: Text("Category")
                            .foregroundColor(Color("DarkPurple"))
                            .font(.custom("NotoSansOriya", size: Spacing.considerable))) {
                                
                                Spacer()
                                Picker("Select a category", selection: $viewModel.selectedCategory) {
                                    ForEach(viewModel.dropdownOptions, id: \.self) { dropdownOption in
                                        Text(dropdownOption)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                            }
                    }
                    
                    //Buttons
                    HStack {
                        Button(action: {
                            viewModel.handleButtonToggle()
                        }) {
                            Image(systemName: viewModel.isTaskComplete ? "checkmark.circle.fill" : "circle")
                                .resizable()
                                .frame(width: Spacing.large, height: Spacing.large)
                                .foregroundColor(viewModel.isTaskComplete ? Color.cPink : Color.cPink)
                        }
                        
                        Text("Mark As Complete?")
                            .foregroundColor(Color("DarkPurple"))
                            .font(Font.custom("NotoSansOriya", size: Spacing.medium))
                            .baselineOffset(-3)
                        Spacer()
                    }
                    
                    //Save Changes Button
                    Button(action: {
                        viewModel.addToTaskListArray()
                        
                    }) {
                        Text("Save Changes")
                            .font(Font.custom("NotoSansOriya", size: Spacing.medium))
                            .foregroundColor(Color("DarkestPurple"))
                            .padding(12.0)
                            .background(Color.cPink)
                            .cornerRadius(Spacing.medium)
                    }
                    
                    
                    // Delete Button
                    Button(action: {
                        viewModel.emptyTaskListArray()
                    }) {
                        HStack(alignment: .center) {
                            Image(systemName: "delete.left")
                                .font(.system(size: Spacing.large, weight: .bold))
                                .foregroundColor(Color.cPink)
                            Text("Delete Task")
                                .font(Font.custom("NotoSansOriya", size: Spacing.medium))
                                .foregroundColor(Color.cPink)
                                .baselineOffset(-5) 
                        }
                        .padding(11.0)
                        .background(Color("DarkestPurple"))
                        .cornerRadius(Spacing.medium)
                    }
                    Spacer()
                }
                .padding(.horizontal, Spacing.spacious)
            }
            .background(Color("Rose"))
        }
    }
}


#Preview {
    AddTaskView()
}
