//
//  ContentView.swift
//  AIMealPlanner
//
//  Created by Gulnaz Kaztayeva on 08.02.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Inter test")
                .font(.custom("Inter18pt-Black", size: 24))
        }
        .padding()
        .onAppear{
                    for family in UIFont.familyNames.sorted() {
                        let names = UIFont.fontNames(forFamilyName: family)
                        print("Family: \(family) Font names: \(names)")
                    }
                }
    }
}

#Preview {
    ContentView()
}
