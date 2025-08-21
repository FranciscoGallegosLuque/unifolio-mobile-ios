//
//  TabBarModifier.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 21/08/2025.
//

import SwiftUI

struct TabBarModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 6)
            .padding(.horizontal, 25)
            .background(
                Capsule()
                    .fill(Color.theme.secondaryBlack)
                    .overlay(
                        Capsule()
                            .strokeBorder(LinearGradient.theme.strokeTabBarGradient, lineWidth: 1).opacity(0.3)
                    )

            )
    }
}

extension View {
    func tabBarModifier() -> some View {
        return self.modifier(TabBarModifier())
    }
}
