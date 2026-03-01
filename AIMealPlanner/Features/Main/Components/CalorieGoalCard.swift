//
//  CalorieGoalCard.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 24.02.2026.
//

import SwiftUI

struct CalorieGoalCard: View {
    let min: Double = 1200
    let max: Double = 3500

    @State private var value: Double = 2000

    var body: some View {
        VStack(alignment: .leading, spacing: 26) {
            HStack {
                Text("Daily Calorie Goal")
                    .inter(font: .semibold, size: 18)
                Spacer()
                Text("\(Int(value)) cal")
                    .inter(font: .bold, size: 16)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        Capsule().fill(Color.purple.opacity(0.15))
                    )
                    .foregroundStyle(.purple)
            }

            GradientSlider(value: $value, range: min...max)

            HStack {
                Text("\(Int(min))")
                Spacer()
                Text("\(Int(max))")
            }
            .inter(font:.regular, size: 12)
            .foregroundStyle(.appGrey)
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.white))
        )
    }
}
