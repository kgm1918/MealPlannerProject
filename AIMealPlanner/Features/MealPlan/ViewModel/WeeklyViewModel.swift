//
//  WeeklyViewModel.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 27.02.2026.
//

import Foundation


@MainActor
final class WeeklyViewModel: ObservableObject {
    @Published var days: [DayPlan] = []
    @Published var isLoading = false
    @Published var errorText: String?

    private let baseURL = "http://localhost:3000"
    private let weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    private func weekKey() -> String {
        let f = DateFormatter()
        f.dateFormat = "YYYY-ww"
        return f.string(from: Date())
    }

    func load(calorieGoal: Int) {
        isLoading = true
        errorText = nil
        days = []

        Task {
            do {
                var usedTitles = Set<String>()
                var results: [DayPlan] = []

                for dayTitle in weekDays {
                    let plan = try await DailyAPI.fetchDayPlan(
                        baseURL: baseURL,
                        calorieGoal: calorieGoal,
                        diet: "balanced",
                        allergies: [],
                        dayTitle: dayTitle,
                        excludeTitles: Array(usedTitles),
                        seed: "\(weekKey())-\(dayTitle)-\(calorieGoal)"
                    )
                    plan.meals.forEach { usedTitles.insert($0.title) }
                    results.append(plan)
                }

                self.days = results
            } catch {
                self.errorText = error.localizedDescription
            }

            self.isLoading = false
        }
    }
}
