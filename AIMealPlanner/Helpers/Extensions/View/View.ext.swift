//
//  View.ext.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 09.02.2026.
//

import SwiftUI

extension View {
    func inter(font: Inter = .regular, size: CGFloat = 14) -> some View{
        self
            .font(.custom(font.rawValue, size: size))
    }
}
