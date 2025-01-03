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
        let viewModel = TaskViewModel(router: router)
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HomeView(viewModel: viewModel)
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        case .addTask:
                            AddTaskView(viewModel: viewModel)

                        case .aboutPage:
                            AboutPageView(viewModel: viewModel)

                        case .allTasks:
                            AllTasksView(viewModel: viewModel)

                        case .home:
                            HomeView(viewModel: viewModel)
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
