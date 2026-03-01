//
//  AllergyCard.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 12.02.2026.
//

import SwiftUI


struct AllergyCard : View {
    let allergy: AllergyType
    @Binding var selected: Set<AllergyType>

    private var isSelected: Bool { selected.contains(allergy) }

    var body: some View {
        Button {
            if isSelected { selected.remove(allergy) }
            else { selected.insert(allergy) }
        } label: {
            HStack(spacing: 7) {
                Text(allergy.emoji)
                Text(allergy.rawValue)
                    .inter(font: .medium, size: 16)
                    .foregroundStyle(.fontColor1)
            }
            .padding(.horizontal, 17)
            .padding(.vertical, 12)
            .background(
                Capsule()
                    .fill(isSelected ? .appPurple.opacity(0.12) : .white)
            )
            .overlay(
                Capsule()
                    .stroke(isSelected ? .appPurple : .cornerColorType, lineWidth: 1)
            )
        }
    }
}



