//
//  OnboardingPageView.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 09.02.2026.
//

import SwiftUI

struct OnboardingPageView: View {
    let page: Onboarding
    
    var body: some View{
            VStack(spacing: 17) {
                VStack(spacing: 32) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 32)
                            .fill(
                                LinearGradient(colors: page.gradientColors,
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                            )
                            .frame(width: 112, height: 112)
                        
                        if let asset = page.iconAssetName {
                            Image(asset)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 56, height: 56)
                        } else if let sys = page.iconSystemName {
                            Image(systemName: sys)
                                .font(.system(size: 48))
                                .foregroundStyle(.white)
                        }
                    }
                    
                    Text(page.title)
                        .inter(font: .bold, size: 30)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                
                Text(page.subtitle)
                    .inter(font: .regular, size: 18)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 63)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 195)
        }
    }
