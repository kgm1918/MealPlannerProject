//
//  AIService.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 25.02.2026.
//

import Foundation

struct AIService {
    static func generateWeek() async throws -> [DayPlan] {
        try await Task.sleep(nanoseconds: 600_000_000)

        return [
            DayPlan(dayTitle: "Monday", totalCalories: 1520, meals: sampleMeals),
            DayPlan(dayTitle: "Tuesday", totalCalories: 1450, meals: sampleMeals),
            DayPlan(dayTitle: "Wednesday", totalCalories: 1600, meals: sampleMeals),
            DayPlan(dayTitle: "Thursday", totalCalories: 1500, meals: sampleMeals),
            DayPlan(dayTitle: "Friday", totalCalories: 1700, meals: sampleMeals),
            DayPlan(dayTitle: "Saturday", totalCalories: 1800, meals: sampleMeals),
            DayPlan(dayTitle: "Sunday", totalCalories: 1400, meals: sampleMeals),
        ]
    }

    static var sampleMeals: [MealItem] {
        [
            MealItem(type: .breakfast, title: "Avocado Toast", calories: 350, proteinGrams: 12, iconName: "keto"),
            MealItem(type: .lunch, title: "Chicken Caesar Salad", calories: 520, proteinGrams: 42, iconName: "balanced"),
            MealItem(type: .dinner, title: "Salmon with Veggies", calories: 650, proteinGrams: 48, iconName: "fish"),
        ]
    }
   
}
