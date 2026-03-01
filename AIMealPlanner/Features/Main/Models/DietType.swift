//
//  DietType.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 11.02.2026.
//

import Foundation

enum DietType: String, CaseIterable, Identifiable {
    case balanced = "Balanced"
    case lowCarb = "Low Carb"
    case highProtein = "High Protein"
    case vegetarian = "Vegetarian"
    case vegan = "Vegan"
    case keto = "Keto"

    var id: String { rawValue }

    var description: String {
        switch self {
        case .balanced: return "Mix of all food groups"
        case .lowCarb: return "Reduced carbs"
        case .highProtein: return "Protein-focused"
        case .vegetarian: return "No meat or fish"
        case .vegan: return "No animal products"
        case .keto: return "Very low carb, high fat"
        }
    }

    var imageName: String {
        switch self {
        case .balanced: return "balanced"
        case .lowCarb: return "meat"
        case .highProtein: return "muscle"
        case .vegetarian: return "plant"
        case .vegan: return "vegan"
        case .keto: return "keto"
        }
    }
}

