//
//  DailyViewHeader.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 24.02.2026.
//

import SwiftUI

struct DailyViewHeader : View {
    @Binding var selected: PlanType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    Text("Meal Plan")
                        .inter(font: .semibold, size: 20)
                    Text("AI-Powered")
                        .inter(font: .regular, size: 14)
                        .foregroundStyle(.appPurple)
                }
                .padding(.leading, 80)
                Spacer()
                Button {
                    
                } label: {
                    Image("cart")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 12)
                }
                .background(LinearGradient(
                            colors: [.appPurple, .appPink],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.trailing, 24)
            }
            .padding(.horizontal, 24)
            PlanSegmentedControl(selected: $selected)
                           .padding(.horizontal, 24)
            
            Divider()
                .frame(height: 1)
                .overlay(.black)
        }
        
    }
}



struct PlanSegmentedControl: View {
    @Binding var selected: PlanType

    var body: some View {
        HStack(spacing: 0) {
            segment(title: "Daily", type: .daily)
            segment(title: "Weekly", type: .weekly)
        }
        .padding(4)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.black.opacity(0.06))
        )
    }

    private func segment(title: String, type: PlanType) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                selected = type
            }
        } label: {
            Text(title)
                .inter(font: .medium, size: 16)
                .frame(maxWidth: .infinity)
                .foregroundStyle(selected == type ? .appPurple : .appGrey)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(Color(.white))
                        .opacity(selected == type ? 1 : 0)
                )
        }
    }
}

