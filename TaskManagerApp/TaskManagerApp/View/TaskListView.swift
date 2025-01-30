//
//  TaskListView.swift
//  TaskManagerApp
//
//  Created by Batuhan Arda on 28.01.2025.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskViewModel(service:TaskServiceImpl())

    var body: some View {
        NavigationView {
            List(viewModel.tasks) { task in
                NavigationLink(destination: TaskDetailView(task: task)) {
                    HStack {
                        Text(task.title)
                        Spacer()
                        if task.completed {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                   
                }
            }
            .task {
                await viewModel.loadTasks()
            }
            .navigationTitle("Tasks")
        }
    }
}

#Preview {
    TaskListView()
}
