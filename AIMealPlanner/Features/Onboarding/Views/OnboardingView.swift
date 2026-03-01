//
//  OnboardingView.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 09.02.2026.
//

import SwiftUI

struct OnboardingView: View {
    @State private var pageIndex = 0
    @State private var showMain = false

    private let pages: [Onboarding] = [  .init(
        id: 0,
        title: "Welcome to AI Meal Planner",
        subtitle: "Your personal chef powered by artificial intelligence. Plan healthy meals effortlessly.",
        iconSystemName: nil,
        iconAssetName: "chefhat",
        gradientColors: [.appLavender2, .appDeepBlue]
    ),
    .init(
        id: 1,
        title: "AI-Powered Suggestions",
        subtitle: "Get personalized meal recommendations based on your preferences and dietary needs.",
        iconSystemName: "sparkles",
        iconAssetName: nil,
        gradientColors: [.appPurple, .appPink]
    ),
    .init(id: 2, title: "Track your nutrition", subtitle: "Monitor calories, macros, and make informed choices about your diet.", iconSystemName: nil, iconAssetName: "apple", gradientColors: [.appPink2, .appCoral]),
    .init(id: 3, title: "Weekly planning", subtitle: "Plan your meals for the entire week with automated shopping lists.", iconSystemName: nil, iconAssetName: "calendar", gradientColors: [.appCoral, .appOrange])]

    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(
                    colors: [.appLavender, .appBlue],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                TabView(selection: $pageIndex) {
                    ForEach(pages) { page in
                        OnboardingPageView(page: page)
                            .tag(page.id)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea()
                .overlay(alignment: .top) {
                    VStack(spacing: 48) {
                        PageIndicator(count: pages.count, currentIndex: pageIndex)
                        
                        HStack(spacing: 12) {
                            if pageIndex < pages.count - 1 {
                                ClearButton(text: "Skip") {
                                    showMain = true
                                }
                            }
                            
                            FullButton(text: pageIndex == pages.count - 1 ? "Get Started" : "Next") {
                                if pageIndex < pages.count - 1 {
                                    pageIndex += 1
                                } else {
                                    showMain = true
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                    .padding(.top, 560)
                }
                .navigationDestination(isPresented: $showMain) {
                        MainView()
                            .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
