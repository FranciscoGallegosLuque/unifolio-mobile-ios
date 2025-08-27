//
//  Gradients.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 21/08/2025.
//

import Foundation
import SwiftUI

extension LinearGradient {
    static let theme = GradientTheme()
}

struct GradientTheme {
    func diagonalGradient(fromColor firstColor: Color, toColor lastColor: Color) -> LinearGradient {
        return LinearGradient(
            colors: [
                firstColor, lastColor,
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    let uploadButtonFillGradient = LinearGradient(
        colors: [
            Color.theme.primaryPurple, Color.theme.secondaryPurple,
        ],
        startPoint: .center,
        endPoint: .bottom
    )
}
