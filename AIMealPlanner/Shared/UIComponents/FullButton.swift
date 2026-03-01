//
//  FullButton.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 09.02.2026.
//

import SwiftUI

struct FullButton : View {
    var text: String
    var action : () -> Void
    var body: some View {
        Button(action: action) {
            Text(text)
                .inter(font: .semibold, size: 16)
                .foregroundStyle(.white)
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity)
        }
        .background(
            LinearGradient(
                colors: [.appPurple, .appPink],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

