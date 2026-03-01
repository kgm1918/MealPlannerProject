//
//  MealIcons.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 25.02.2026.
//

import SwiftUI

struct MealIcons: View {
    let icons: [String]
    let colors : [Color] = [.appYellow, .appGreen, .appLavender]

    var body: some View {
        HStack(spacing: -10) {
            ForEach(Array(icons.prefix(3).enumerated()), id: \.offset) { index, name in
                Image(name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .padding(10)
                    .background(
                        Circle().fill(colors[index])
                    )
                    .overlay(
                        Circle().stroke(Color.black.opacity(0.06), lineWidth: 1)
                    )
            }
        }
    }
}

