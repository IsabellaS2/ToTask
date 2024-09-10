//
//  HomePageView.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 10/09/2024.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        TabView {
            Text("Home")
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
        //accent color is depreciated, what else can i use?
    }
}


#Preview {
    HomePageView()
}
