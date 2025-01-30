//
//  Task.swift
//  TaskManagerApp
//
//  Created by Batuhan Arda on 28.01.2025.
//

import Foundation

struct TodoTask: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

