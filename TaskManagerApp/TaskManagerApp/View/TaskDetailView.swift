//
//  TaskDetailView.swift
//  TaskManagerApp
//
//  Created by Batuhan Arda on 28.01.2025.
//

import SwiftUI

struct TaskDetailView: View {
    let task: TodoTask

    var body: some View {
        VStack {
            Text(task.title).font(.largeTitle)
            Spacer()
            Text(task.completed ? "Completed" : "Pending")
                .foregroundColor(task.completed ? .green : .red)
        }
        .padding()
    }
}

#Preview {
    TaskDetailView(task: TodoTask(userId: 5, id: 5, title: "do it", completed: true))
}
