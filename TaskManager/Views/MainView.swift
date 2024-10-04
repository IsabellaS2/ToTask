//
//  HomePageView.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 10/09/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            
            AddTaskView()
                .tabItem {
                    Label("Task List", systemImage: "list.bullet")
                }
            
            
            AboutPageView()
                .tabItem {
                    Label("Help", systemImage: "questionmark")
                }
        }
    }
}


#Preview {
    MainView()
}


