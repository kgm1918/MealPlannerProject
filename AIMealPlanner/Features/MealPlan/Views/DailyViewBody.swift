//
//  DailyViewBody.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 25.02.2026.
//

import SwiftUI

struct DailyViewBody: View {
    @ObservedObject var vm: DailyViewModel

    var body: some View {
        VStack(spacing: 24) {
            header

            if vm.isLoading {
                ProgressView().padding(.top, 40)
            } else if let day = vm.day {
                VStack(spacing: 16) {
                    ForEach(day.meals) { meal in
                        MealCard(meal: meal)
                    }
                }
                .padding(.horizontal, 24)
            } else if let err = vm.errorText {
                Text(err).foregroundStyle(.red).padding(.top, 40)
            } else {
                Text("No plan yet")
                    .foregroundStyle(.secondary)
                    .padding(.top, 40)
            }

            regenerateButton
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .onAppear { vm.load(calorieGoal: 2000) }
    }

    private var header: some View {
        VStack(spacing: 8) {

            HStack {
                Button {
                    vm.previousDay()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(vm.currentIndex == 0 ? .gray : .appPurple)
                }
                .disabled(vm.currentIndex == 0)

                Spacer()

                HStack(spacing: 6) {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(.appPurple)

                    Text("Today")
                        .inter(font: .medium, size: 14)
                        .foregroundStyle(.appPurple)
                }

                Spacer()

                Button {
                    vm.nextDay()
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(vm.currentIndex == vm.days.count - 1 ? .gray : .appPurple)
                }
                .disabled(vm.currentIndex == vm.days.count - 1)
            }
            .padding(.horizontal, 24)
            .padding(.top, 26)

            Text(vm.day?.dayTitle ?? vm.currentDayTitle)
                .inter(font: .bold, size: 24)

            HStack(spacing: 4) {
                Text("\(vm.day?.totalCalories ?? 0)")
                Text("calories")
            }
            .foregroundStyle(.appGrey)
            .inter(font: .regular, size: 14)
        }
    }
   
       private var regenerateButton: some View {
           Button { vm.regenerate(calorieGoal: 2000) } label: {
               HStack {
                   Image("sparkle")
                   Text("Regenerate Day with AI")
                       .inter(font: .semibold, size: 16)
                       .foregroundStyle(.white)
               }
           }
           .padding(.horizontal, 72)
           .padding(.vertical, 16)
           .background(
               LinearGradient(colors: [.appDeepBlue, .appPurple], startPoint: .leading, endPoint: .trailing)
           )
           .clipShape(RoundedRectangle(cornerRadius: 16))
       }
}
