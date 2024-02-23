//ReportCorrectionsEmptyViewDelegate
//  ContentView.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 13/02/2024.

import SwiftUI

struct ContentView: View {
    
    // Date Picker
    @State private var selectedDate: Date = Date()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium // Set date to readable format
        return formatter
    }()
    
    // Catrgory Picker
    @State private var selection1: String? = nil
    
    // Mark Complete Button
    @State private var isTaskComplete: Bool = false

    var body: some View {
        ScrollView {
            ZStack {
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
                    
                    VStack(alignment: .leading) {
                        Text("Current Task Name")
                            .font(.custom("NotoSansOriya", size: Spacing.large))
                            .foregroundColor(Color("DarkPurple"))
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ")
                            .font(.custom("NotoSansOriya", size: Spacing.spacious))
                            .foregroundColor(Color("DarkPurple"))
                    }
                    .padding(Spacing.spacious)
                    
                    VStack(alignment: .center, spacing: 30) {
                        DatePicker("Due Date",
                                   selection: $selectedDate,
                                   displayedComponents: .date)
                            .foregroundColor(Color("DarkPurple"))
                            .font(.custom("NotoSansOriya", size: Spacing.considerable))
                        
                        HStack {
                            Text("Category")
                                .foregroundColor(Color("DarkPurple"))
                                .font(.custom("NotoSansOriya", size: Spacing.considerable))

                            Spacer()
                            DropDownPicker(
                                selection: $selection1,
                                options: [
                                    "School",
                                    "Work",
                                    "Personal",
                                    "Fitness",
                                ]
                            )
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
                                .baselineOffset(-3) // Adjust the baseline offset as needed
                            Spacer()
                        }
                        
                        Button(action: {
                            // Add your action here
                            // This closure is executed when the button is tapped
                        }) {
                            Text("Save Changes")
                                .font(Font.custom("NotoSansOriya", size: Spacing.medium))
                                .foregroundColor(Color("DarkestPurple"))
                                .padding(12.0)
                                .background(Color.cPink)
                                .cornerRadius(Spacing.medium)
                        }
                        
                        Button(action: {
                            // Add your action here
                            // This closure is executed when the button is tapped
                        }) {
                            HStack(alignment: .center) {
                                Image(systemName: "delete.left")
                                    .font(.system(size: Spacing.spacious, weight: .bold))
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
                    }
                    .padding(.horizontal, Spacing.spacious)
                }
            }
        }
        .background(Color.rose.ignoresSafeArea())
    }
}


#Preview {
    ContentView()
}
