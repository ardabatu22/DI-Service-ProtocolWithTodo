//
//  TaskServiceImpl.swift
//  TaskManagerApp
//
//  Created by Batuhan Arda on 28.01.2025.
//

import Foundation

final class TaskServiceImpl: TaskService {
    private let baseURL = "https://jsonplaceholder.typicode.com/todos"

    // Tüm görevleri çekmek için fonksiyon.
    func fetchTasks() async throws -> [TodoTask] {
        // URL'yi kontrol ediyoruz.
        guard let url = URL(string: baseURL) else { throw URLError(.badURL) }
        
        // API çağrısı yapıyoruz.
        let (data, response) = try await URLSession.shared.data(from: url)

        // HTTP yanıtını kontrol ediyoruz.
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }

        // Gelen ham veriyi yazdırarak kontrol ediyoruz.
        print(String(data: data, encoding: .utf8)!)

        // JSON çözümleme yapıyoruz.
        return try JSONDecoder().decode([TodoTask].self, from: data)
    }

    // Belirli bir görevi detaylı olarak çekmek için fonksiyon.
    func fetchTaskDetails(id: Int) async throws -> TodoTask {
        guard let url = URL(string: "\(baseURL)/\(id)") else { throw URLError(.badURL) }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        
        print(String(data: data, encoding: .utf8)!)
        return try JSONDecoder().decode(TodoTask.self, from: data)
    }
    
}
