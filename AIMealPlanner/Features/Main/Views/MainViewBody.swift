//
//  MainViewBody.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 11.02.2026.
//

import SwiftUI


struct MainViewBody : View {
    @State private var selectedDiet: DietType? = .balanced
    @State private var selectedAllergies: Set<AllergyType> = []
    @Binding var goToMealPlan : Bool
    
    var body: some View {
        ZStack(alignment: .topLeading){
            VStack(alignment: .leading, spacing: 32){
                VStack(alignment: .leading, spacing: 16){
                    Text("Diet type")
                        .inter(font: .semibold, size: 18)
                        .padding(.top, 32)
                    VStack{
                        HStack(spacing: 12){
                            DietTypeCard(type: .balanced, selected: $selectedDiet)
                            DietTypeCard(type: .lowCarb, selected: $selectedDiet)
                        }
                        HStack(spacing: 12){
                            DietTypeCard(type: .highProtein, selected: $selectedDiet)
                            DietTypeCard(type: .vegetarian, selected: $selectedDiet)
                        }
                        HStack(spacing: 12){
                            DietTypeCard(type: .vegan, selected: $selectedDiet)
                            DietTypeCard(type: .keto, selected: $selectedDiet)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 16){
                    Text("Allergies and restrictions")
                        .inter(font:.semibold, size: 18)
                    VStack(alignment: .leading, spacing: 12){
                        HStack(spacing: 12){
                            AllergyCard(allergy: .dairy, selected: $selectedAllergies)
                            AllergyCard(allergy: .eggs, selected: $selectedAllergies)
                            AllergyCard(allergy: .peanuts, selected: $selectedAllergies)
                        }
                        HStack(spacing: 12){
                            AllergyCard(allergy: .treeNuts, selected: $selectedAllergies)
                            AllergyCard(allergy: .soy, selected: $selectedAllergies)
                        }
                        HStack(spacing: 12){
                            AllergyCard(allergy: .gluten, selected: $selectedAllergies)
                            AllergyCard(allergy: .fish, selected: $selectedAllergies)
                        }
                        HStack(spacing: 12){
                            AllergyCard(allergy: .shellfish, selected: $selectedAllergies)
                        }
                    }
                    
                }
                VStack{
                    CalorieGoalCard()
                }
                FullButton(text: "Continue to Meal Plan"){
                    goToMealPlan = true
                }
            }
            .padding(.horizontal, 24)
        }
    }
}
