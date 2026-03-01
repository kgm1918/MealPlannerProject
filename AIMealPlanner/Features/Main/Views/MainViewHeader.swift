//
//  MainViewHeader.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 11.02.2026.
//

import SwiftUI


struct MainViewHeader : View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            VStack(alignment: .leading, spacing: 4){
                Text("Set your preferences")
                    .inter(font: .semibold, size: 20)
                Text("Personalize your meal plan")
                    .inter(font: .regular, size: 14)
            }
            .padding(.leading, 80)
            Divider()
                .frame(height: 1)
                .overlay(.black)
        }
        
    }
}
