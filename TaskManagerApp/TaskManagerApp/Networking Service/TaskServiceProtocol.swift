//
//  TaskServiceProtocol.swift
//  TaskManagerApp
//
//  Created by Batuhan Arda on 28.01.2025.
//

import Foundation

protocol TaskService {
    func fetchTasks() async throws -> [TodoTask]
    func fetchTaskDetails(id: Int) async throws -> TodoTask
}
// Bu bizim protokolumuz şimdi bu protokolu uygulayan(conforming) bir servis yazmamız gerekiyor.
