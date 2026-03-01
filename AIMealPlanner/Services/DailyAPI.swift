//
//  DailyAPI.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 25.02.2026.
//

import Foundation

struct DayPlanRequest: Encodable {
    let calorieGoal: Int
    let diet: String
    let allergies: [String]
    let dayTitle: String
    let excludeTitles: [String]
    let seed: String
}

enum DailyAPI {
    static func fetchDayPlan(
           baseURL: String,
           calorieGoal: Int,
           diet: String = "meat",
           allergies: [String] = [],
           dayTitle: String,
           excludeTitles: [String] = [],
           seed: String
    ) async throws -> DayPlan {

        let url = URL(string: "\(baseURL)/dayplan")!
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try JSONEncoder().encode(
            DayPlanRequest(
                calorieGoal: calorieGoal,
                diet: diet,
                allergies: allergies,
                dayTitle: dayTitle,
                excludeTitles: excludeTitles,
                seed: seed
            )
        )

        let (data, response) = try await URLSession.shared.data(for: req)
        guard let http = response as? HTTPURLResponse, (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        let body = DayPlanRequest(
            calorieGoal: calorieGoal,
            diet: diet,
            allergies: allergies,
            dayTitle: dayTitle,
            excludeTitles: excludeTitles,
            seed: seed
        )

        let encoded = try JSONEncoder().encode(body)
        print(String(data: encoded, encoding: .utf8) ?? "no json")
        req.httpBody = encoded
        return try JSONDecoder().decode(DayPlan.self, from: data)
        
    }
    
}
