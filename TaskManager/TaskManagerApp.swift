//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 13/02/2024.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    @ObservedObject var router = Router()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HomeView(viewModel: TaskViewModel(router: router))
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        case .addTask:
                            AddTaskView(viewModel: TaskViewModel(router: router))
                        case .aboutPage:
                            AboutPageView(viewModel: TaskViewModel(router: router))
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
