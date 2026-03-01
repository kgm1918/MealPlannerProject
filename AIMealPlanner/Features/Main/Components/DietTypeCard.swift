//
//  DietTypeCard.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 11.02.2026.
//

import SwiftUI

struct DietTypeCard: View {
    let type: DietType
    @Binding var selected: DietType?

    private var isSelected: Bool { selected == type }

    var body: some View {
        Button {
            selected = type
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(type.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)

                    Spacer()

                    if isSelected {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.purple)
                    }
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(type.rawValue)
                        .inter(font: .semibold, size: 16)
                        .foregroundStyle(.black)

                    Text(type.description)
                        .inter(font: .medium, size: 12)
                        .foregroundStyle(.appGrey)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 18)
            .padding(.vertical, 18)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(isSelected ? .purple.opacity(0.08) : .clear)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isSelected ? .purple : .cornerColorType, lineWidth: 2)
            }
        }
    }
}

