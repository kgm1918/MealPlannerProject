//
//  ClearButton.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 09.02.2026.
//

import SwiftUI

struct ClearButton : View {
    var text : String
    var action : () -> Void
    var body: some View {
        Button(action: action){
            Text(text)
                .inter(font: .medium, size: 16)
                .foregroundStyle(.black)
                .padding(.horizontal, 65)
                .padding(.vertical, 15)
        }
        }
    }
