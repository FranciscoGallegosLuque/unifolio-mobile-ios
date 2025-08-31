//
//  ReturnsChangeView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 28/08/2025.
//

import SwiftUI

struct ReturnsChangeCapsule: View {
    let change: Double
    let period: ReturnsTimePeriod
    
    var displayedPeriod: String {
        switch period {
        case .daily:
            "diario"
        case .allTime:
            "histórico"
        }
    }
    
    var body: some View {
        HStack(spacing: Layout.PercentageChangeCard.spacing) {
            returnsArrow
            Text("\(change.asPercentString()) \(displayedPeriod)").font(.callout)
        }
        .padding(.vertical, Layout.PercentageChangeCard.verticalPadding)
        .padding(.horizontal, Layout.PercentageChangeCard.horizontalPadding)
        .background(percentageCardBackground)
    }
}

#Preview {
    ReturnsChangeCapsule(change: 4, period: .daily)
}

extension ReturnsChangeCapsule {
    private var returnsArrow: some View {
        Image(systemName: (change > .zero) ? "arrow.up" : "arrow.down")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(
                (change > .zero)
                    ? Color.theme.primaryGreen
                    : Color.theme.tertiaryRed
            )
    }
    
    private var percentageCardBackground: some View {
        Capsule()
            .fill(
                (change > .zero ? Color.theme.primaryGreen : .tertiaryRed)
                    .opacity(
                        Layout.PercentageChangeCardBackground.opacity
                    )
            )
            .overlay(percentageCardBackgroundOverlay)
    }
    
    
    private var percentageCardBackgroundOverlay: some View {
        Capsule()
            .strokeBorder(
                LinearGradient.theme
                    .diagonalGradient(
                        fromColor: change > .zero ? .primaryGreen : .tertiaryRed,
                        toColor: .secondaryGray
                    ),
                lineWidth: Layout.PercentageChangeCardBackground
                    .lineWidth
            ).opacity(Layout.PercentageChangeCardBackground.opacity)
    }
    
}

private enum Layout {
    enum PercentageChangeCard {
        static let verticalPadding: CGFloat = 6
        static let horizontalPadding: CGFloat = 10
        static let spacing: CGFloat = 2
    }

    enum PercentageChangeCardBackground {
        static let cornerRadius: CGFloat = 10
        static let opacity: CGFloat = 0.3
        static let lineWidth: CGFloat = 1
    }
}

enum ReturnsTimePeriod: String {
    case daily
    case allTime
}
