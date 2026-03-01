//
//  GradientSlider.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 24.02.2026.
//

import SwiftUI

struct GradientSlider: View {
    @Binding var value: Double
    let range: ClosedRange<Double>

    private let trackHeight: CGFloat = 8
    private let knobSize: CGFloat = 19

    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let t = CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound))
            let x = max(0, min(1, t)) * width

            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.black.opacity(0.08))
                    .frame(height: trackHeight)

                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [.appBlue, .appLavender, .appLightPink],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: x, height: trackHeight)

                Circle()
                    .fill(Color(.systemBackground))
                    .frame(width: knobSize, height: knobSize)
                    .overlay(
                        Circle().stroke(Color.black.opacity(0.08), lineWidth: 1)
                    )
                    .offset(x: x - knobSize / 2)
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { g in
                        let clampedX = min(max(0, g.location.x), width)
                        let p = clampedX / width
                        let newValue = range.lowerBound + Double(p) * (range.upperBound - range.lowerBound)
                        value = newValue.rounded()
                    }
            )
        }
    }
}

