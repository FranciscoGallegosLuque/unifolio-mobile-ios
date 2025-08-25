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
                RoundedRectangle(cornerRadius: Layout.Background.cornerRadius)
                    .fill(Color.theme.secondaryBlack)
                    .overlay(
                        RoundedRectangle(
                            cornerRadius: Layout.Background.cornerRadius
                        )
                        .strokeBorder(
                            LinearGradient.theme.diagonalGradient(
                                fromColor: .primaryWhite,
                                toColor: .secondaryGray
                            ),
                            lineWidth: Layout.Background.lineWidth
                        ).opacity(Layout.Background.opacity)

                    )

            )
    }
}

extension View {
    func tabBarModifier() -> some View {
        return self.modifier(TabBarModifier())
    }
}

private enum Layout {
    enum Background {
        static let cornerRadius: CGFloat = 38
        static let lineWidth: CGFloat = 1
        static let opacity: CGFloat = 0.3
    }
}
