//  ContentView.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 13/02/2024.

import SwiftUI

struct Task {
    var title: String
    var description: String
    var dueDate: Date
    var category: String
    var isComplete: Bool
}

struct ContentView: View {
    @State private var taskList: [Task] = []
    
    @State private var selectedDate: Date = Date()
    @State private var selectedCategory: String = "School"
    @State private var isTaskComplete: Bool = false
    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""
    
    var dropdownOptions = ["School", "Work", "Personal", "Fitness"]
    
    
    var body: some View {
        
        NavigationView {
            VStack {
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
                
                VStack(alignment: .leading) {
                    TextField("Current Task Name", text: $taskTitle)
                        .font(.custom("NotoSansOriya", size: Spacing.large))
                        .foregroundColor(Color("DarkPurple"))
                    
                    TextField("Task Description", text: $taskDescription)
                        .font(.custom("NotoSansOriya", size: Spacing.spacious))
                        .foregroundColor(Color("DarkPurple"))
                }
                .padding(Spacing.spacious)
                
                VStack(alignment: .center, spacing: 30) {
                    DatePicker("Due Date", selection: $selectedDate, displayedComponents: .date)
                        .foregroundColor(Color("DarkPurple"))
                        .font(.custom("NotoSansOriya", size: Spacing.considerable))
                    
                    
                    HStack {
                        Section(header: Text("Category")
                            .foregroundColor(Color("DarkPurple"))
                            .font(.custom("NotoSansOriya", size: Spacing.considerable))) {
                                
                                Spacer()
                                Picker("Select a category", selection: $selectedCategory) {
                                    ForEach(dropdownOptions, id: \.self) { dropdownOption in
                                        Text(dropdownOption)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                            }
                    }
                    
                    HStack {
                        Button(action: {
                            isTaskComplete.toggle()
                        }) {
                            Image(systemName: isTaskComplete ? "checkmark.circle.fill" : "circle")
                                .resizable()
                                .frame(width: Spacing.large, height: Spacing.large)
                                .foregroundColor(isTaskComplete ? Color.cPink : Color.cPink)
                        }
                        
                        Text("Mark As Complete?")
                            .foregroundColor(Color("DarkPurple"))
                            .font(Font.custom("NotoSansOriya", size: Spacing.medium))
                            .baselineOffset(-3)
                        Spacer()
                    }
                    
                    //Save Changes Button
                    Button(action: {
                        let newTask = Task(
                            title: taskTitle,
                            description: taskDescription,
                            dueDate: selectedDate,
                            category: selectedCategory,
                            isComplete: isTaskComplete
                        )
                        taskList.append(newTask)
                        print(taskList)
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
                        taskList.removeAll()
                        print(taskList)
                        
                    }) {
                        HStack(alignment: .center) {
                            Image(systemName: "delete.left")
                                .font(.system(size: Spacing.large, weight: .bold))
                                .foregroundColor(Color.cPink)
                            Text("Delete Task")
                                .font(Font.custom("NotoSansOriya", size: Spacing.medium))
                                .foregroundColor(Color.cPink)
                                .baselineOffset(-5) // Adjust the baseline offset as needed
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
    ContentView()
}
