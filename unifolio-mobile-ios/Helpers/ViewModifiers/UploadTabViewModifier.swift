//
//  UploadTabViewModifier.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 21/08/2025.
//

import SwiftUI

struct UploadButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient.theme.uploadButtonFillGradient)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(
                                LinearGradient.theme.strokeGradient,
                                lineWidth: 1
                            )
                            .opacity(0.3)
                    )
            )
    }
}

extension View {
    func uploadButtonModifier() -> some View {
        return self.modifier(UploadButtonModifier())
    }
}
