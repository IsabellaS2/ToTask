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
                Text("Hi, Welcome Back!")
                    .font(.custom("Gill Sans", size: Spacing.large))
                    .foregroundColor(Color("DarkPurple"))
                
                
                Text("Tasks for Today")
                    .font(.custom("Gill Sans", size: Spacing.large))
                    .foregroundColor(Color("DarkPurple"))
                
                
                Text(Date().formatted(date: .complete, time: .omitted))
                    .font(.custom("Gill Sans", size: Spacing.medium))
                    .foregroundColor(Color("DarkPurple"))
            
            Spacer()
        }
        .padding()
        .background(Color("Rose"))

    }
    
}

#Preview {
    HomeView()
}
