//
//  WeeklyViewBody.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 25.02.2026.
//

import SwiftUI


struct WeeklyViewBody: View {
    @ObservedObject var dailyVM: DailyViewModel

    var body: some View {
        VStack(spacing: 12) {
            ForEach(dailyVM.days, id: \.self) { dayTitle in
                if let plan = dailyVM.cachedDays[dayTitle] {
                    DayCard(day: plan)
                } else {
                    DayCardPlaceholder(dayTitle: dayTitle)
                }
            }
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.top, 25)
    }
}

struct DayCardPlaceholder: View {
    let dayTitle: String

    var body: some View {
        HStack {
            Text(dayTitle)
            Spacer()
            Text("— cal")
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
