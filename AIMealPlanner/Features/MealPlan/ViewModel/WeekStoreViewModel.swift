//
//  WeekStoreViewModel.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 27.02.2026.
//

import Foundation

@MainActor
final class WeekStore: ObservableObject {
    @Published var days: [DayPlan] = []
    @Published var isLoading = false
    @Published var errorText: String?

    private let baseURL = "http://localhost:3000"
    private let weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

    private func weekKey() -> String {
        let f = DateFormatter()
        f.dateFormat = "YYYY-ww"
        return f.string(from: Date())
    }

    func loadWeek(calorieGoal: Int) {
        // если уже есть — не генерим заново
        if !days.isEmpty { return }

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

    func plan(for dayTitle: String) -> DayPlan? {
        days.first { $0.dayTitle == dayTitle }
    }
}
