//
//  MealCard.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 25.02.2026.
//

import SwiftUI

struct MealCard: View {
    let meal: MealItem

    var body: some View {
        HStack(spacing: 16) {
            Image(meal.iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 36)
                .padding(.horizontal, 17)
                .padding(.vertical, 14)
                .background(.picBack)
                .clipShape(RoundedRectangle(cornerRadius: 16))

            VStack(alignment: .leading, spacing: 4) {
                Text(meal.type.rawValue)
                    .inter(font: .semibold, size: 12)
                    .foregroundStyle(.appPurple)

                Text(meal.title)
                    .inter(font: .semibold, size: 16)

                HStack(spacing: 8) {
                    Text("\(meal.calories) cal")
                        .inter(font: .medium, size: 12)
                        .foregroundStyle(.appGrey)

                    Text("•").foregroundStyle(.appGrey)

                    Text("\(meal.proteinGrams)g protein")
                        .inter(font: .medium, size: 12)
                        .foregroundStyle(.appGrey)
                }
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.appGrey)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}
