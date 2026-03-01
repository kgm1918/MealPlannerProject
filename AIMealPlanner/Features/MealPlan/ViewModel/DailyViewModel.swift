//
//  DailyViewModel.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 25.02.2026.
//

import Foundation

@MainActor
final class DailyViewModel: ObservableObject {
    @Published var day: DayPlan?
    @Published var isLoading = false
    @Published var errorText: String?

    private let baseURL = "http://localhost:3000"
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @Published var currentIndex = 0

    @Published var cachedDays: [String: DayPlan] = [:]

    var currentDayTitle: String { days[currentIndex] }

    private func weekKey() -> String {
        let f = DateFormatter()
        f.dateFormat = "YYYY-ww"
        return f.string(from: Date())
    }

    private func seedFor(dayTitle: String, calorieGoal: Int) -> String {
        "\(weekKey())-\(dayTitle)-\(calorieGoal)"
    }

    func load(calorieGoal: Int) {
        let title = currentDayTitle

        if let cached = cachedDays[title] {
            self.day = cached
            return
        }

        isLoading = true
        errorText = nil

        Task {
            do {
                let result = try await DailyAPI.fetchDayPlan(
                    baseURL: baseURL,
                    calorieGoal: calorieGoal,
                    diet: "balanced",
                    allergies: [],
                    dayTitle: title,
                    excludeTitles: [],
                    seed: seedFor(dayTitle: title, calorieGoal: calorieGoal)
                )

                self.cachedDays[title] = result
                self.day = result
            } catch {
                self.errorText = error.localizedDescription
            }
            self.isLoading = false
        }
    }
    
    func loadFromCache() {
        let title = currentDayTitle
        day = cachedDays[title]
    }

    func nextDay() {
        guard currentIndex < days.count - 1 else { return }
        currentIndex += 1
        loadFromCache()
    }

    func previousDay() {
        guard currentIndex > 0 else { return }
        currentIndex -= 1
        loadFromCache()
    }
    
   
    
    func generateFullWeek(calorieGoal: Int) async {
        isLoading = true
        errorText = nil

        for title in days {
            if cachedDays[title] != nil { continue }

            do {
                let result = try await DailyAPI.fetchDayPlan(
                    baseURL: baseURL,
                    calorieGoal: calorieGoal,
                    diet: "balanced",
                    allergies: [],
                    dayTitle: title,
                    excludeTitles: [],
                    seed: seedFor(dayTitle: title, calorieGoal: calorieGoal)
                )
                cachedDays[title] = result
            } catch {
                errorText = error.localizedDescription
                break
            }
        }

        let title = currentDayTitle
        day = cachedDays[title]

        isLoading = false
    }

    func regenerate(calorieGoal: Int) {
        let title = currentDayTitle
        let exclude = day?.meals.map { $0.title } ?? []

        isLoading = true
        errorText = nil

        Task {
            do {
                let result = try await DailyAPI.fetchDayPlan(
                    baseURL: baseURL,
                    calorieGoal: calorieGoal,
                    diet: "balanced",
                    allergies: [],
                    dayTitle: title,
                    excludeTitles: exclude,
                    seed: seedFor(dayTitle: title, calorieGoal: calorieGoal) + "-regen-\(UUID().uuidString.prefix(6))"
                )

                self.cachedDays[title] = result
                self.day = result
            } catch {
                self.errorText = error.localizedDescription
            }
            self.isLoading = false
        }
    }
}
