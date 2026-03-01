//
//  DayPlan.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 25.02.2026.
//

import Foundation

enum MealType: String, CaseIterable, Identifiable, Decodable {
    case breakfast = "BREAKFAST"
    case lunch = "LUNCH"
    case dinner = "DINNER"
    var id: String { rawValue }
}

struct MealItem: Identifiable, Decodable {
    let type: MealType
    let title: String
    let calories: Int
    let proteinGrams: Int
    let iconName: String

    var id: String { type.rawValue + title }
}

struct DayPlan: Identifiable, Decodable {
    let dayTitle: String
    let totalCalories: Int
    let meals: [MealItem]

    var id: String { dayTitle }
}
