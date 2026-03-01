//
//  DailyPlan.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 24.02.2026.
//

import SwiftUI
struct DailyPlan: View {
    @State private var selected: PlanType = .weekly
    @StateObject private var vm = DailyViewModel()

    var body: some View {
        VStack(spacing: 0) {
            DailyViewHeader(selected: $selected)
                .padding(.top, 16)

            Group {
                if selected == .daily {
                    DailyViewBody(vm: vm)
                } else {
                    WeeklyViewBody(dailyVM: vm)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(
                colors: [
                    Color(.appLavender).opacity(0.4),
                    Color(.appBlue).opacity(0.4)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea())
        }
        .task {
            await vm.generateFullWeek(calorieGoal: 2000)
        }
    }
}

#Preview {
    DailyPlan()
}
