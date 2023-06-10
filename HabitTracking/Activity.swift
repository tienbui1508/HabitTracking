//
//  Activity.swift
//  HabitTracking
//
//  Created by Tien Bui on 11/6/2023.
//

import Foundation

struct Activity: Identifiable, Equatable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var streak = 0

    static let example = Activity(name: "Example activity", description: "Example Run boy run run run")
}
