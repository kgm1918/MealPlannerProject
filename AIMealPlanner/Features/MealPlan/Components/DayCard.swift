//
//  DayCard.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 25.02.2026.
//

import SwiftUI


struct DayCard: View {
    let day: DayPlan

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4){
                Text(day.dayTitle)
                    .inter(font: .semibold, size: 16)

                HStack(spacing: 5){
                    Text("\(day.totalCalories) cal")
                    Text("•")
                    Text("\(day.meals.count) meals")
                }
                .inter(font: .medium, size: 14)
                .foregroundStyle(.appGrey)
            }

            Spacer()

            MealIcons(icons: day.meals.map(\.iconName))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
