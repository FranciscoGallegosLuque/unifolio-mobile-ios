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
    let strokeGradient = LinearGradient(
        colors: [
            Color.theme.primaryWhite, Color.theme.secondaryGray,
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    let uploadButtonFillGradient = LinearGradient(
        colors: [
            Color.theme.primaryPurple, Color.theme.secondaryViolet,
        ],
        startPoint: .center,
        endPoint: .bottom
    )
}
