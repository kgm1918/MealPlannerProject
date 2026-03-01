//
//  AllergyType.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 11.02.2026.
//

import Foundation

enum AllergyType: String, CaseIterable, Identifiable {
    case dairy = "Dairy"
    case eggs = "Eggs"
    case peanuts = "Peanuts"
    case treeNuts = "Tree Nuts"
    case soy = "Soy"
    case gluten = "Gluten"
    case fish = "Fish"
    case shellfish = "Shellfish"

    var id: String { rawValue }

    var emoji: String {
        switch self {
        case .dairy: return "🥛"
        case .eggs: return "🥚"
        case .peanuts: return "🥜"
        case .treeNuts: return "🌰"
        case .soy: return "🫘"
        case .gluten: return "🌾"
        case .fish: return "🐟"
        case .shellfish: return "🦐"
        }
    }
}
