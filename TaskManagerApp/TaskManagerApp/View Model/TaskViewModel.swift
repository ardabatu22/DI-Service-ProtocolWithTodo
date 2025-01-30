//
//  TaskViewModel.swift
//  TaskManagerApp
//
//  Created by Batuhan Arda on 28.01.2025.
//

import Foundation

final class TaskViewModel: ObservableObject {
    @Published var tasks: [TodoTask] = []
    @Published var selectedTask: TodoTask?

    private let service: TaskService // Bağımlılığı artık dışarıdan alıyoruz. / Dependency Injection -Constructor Injection

    init(service: TaskService) {
        self.service = service
    }

    func loadTasks() async {
        do {
            let fetchedTasks = try await service.fetchTasks()
            await MainActor.run { // UI güncellemesini ana iş parçacığında yap
                self.tasks = fetchedTasks
            }
        } catch {
            print("Failed to fetch tasks: \(error)")
        }
    }

    func loadTaskDetails(id: Int) async {
        do {
            let fetchedTask = try await service.fetchTaskDetails(id: id)
            await MainActor.run { // UI güncellemesini ana iş parçacığında yap
                self.selectedTask = fetchedTask
            }
        } catch {
            print("Failed to fetch task details: \(error)")
        }
    }
}
