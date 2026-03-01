//
//  PageIndicator.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 09.02.2026.
//

import SwiftUI

struct PageIndicator: View {
    let count: Int
    let currentIndex: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<count, id: \.self) { i in
                Capsule()
                    .fill(i == currentIndex ? Color.purple : Color.gray.opacity(0.25))
                    .frame(width: i == currentIndex ? 28 : 6,
                           height: 6)
                    .animation(.easeInOut(duration: 0.2), value: currentIndex)
            }
        }
    }
}
