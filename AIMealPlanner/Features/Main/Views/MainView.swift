//
//  MainView.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 11.02.2026.
//

import SwiftUI

struct MainView : View {
    @State private var goToMealPlan = false
    var body: some View {
        VStack(spacing: 0){
            MainViewHeader()
                .padding(.top, 16)
            ScrollView{
                MainViewBody(goToMealPlan: $goToMealPlan)
            }
            .background(LinearGradient(
                        colors: [.appLavender, .appBlue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .opacity(0.35))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationDestination(isPresented: $goToMealPlan) {
                       DailyPlan()
                   }
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}
