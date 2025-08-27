//
//  HomeCardView2.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 27/08/2025.
//

import SwiftUI

struct HomeCardView2: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 15) {
                headerSection
                moneySection
                returnsSections
            }
            .padding(26)
            divider
            buttonsSection
        }
        .background(homeCardBackground)
    }
}

#Preview {
    HomeCardView2()
}

extension HomeCardView2 {
    private var headerSection: some View {
        HStack {
            Text("Dólares totales").font(.callout).fontWeight(
                .semibold
            )
            Spacer()
            Image(systemName: "eye")
        }
        .frame(maxWidth: .infinity)
    }

    private var moneySection: some View {
        HStack(alignment: .top, spacing: 0) {
            Text("US$ 1.893").font(.largeTitle).fontWeight(.bold)
            Text("22").font(.title3).fontWeight(.bold).frame(alignment: .top)
        }
    }

    private var returnsSections: some View {
        HStack {
            percentageChangeCard(change: 2, period: .daily)
            percentageChangeCard(change: 125, period: .allTime)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

    private var buttonsSection: some View {
        HStack {
            Text("Movimientos").frame(maxWidth: .infinity).padding(.vertical)

        }
    }

    private var divider: some View {
        Divider().overlay(.primaryWhite).opacity(Layout.Divider.opacity)
    }

    private func percentageChangeCard(change: Int, period: ReturnsTimePeriod)
        -> some View
    {

        let periodText: String
        switch period {
        case .daily:
            periodText = "diario"
        case .allTime:
            periodText = "histórico"
        }

        return
            (HStack(spacing: Layout.PercentageChangeCard.spacing) {
                Image(systemName: (change > 0) ? "arrow.up" : "arrow.down")
                    .fontWeight(.bold)
                    .font(.footnote)
                    .foregroundStyle(
                        (change > 0)
                            ? Color.theme.primaryGreen
                            : Color.theme.primaryPurple
                    )
                Text("\(change)% \(periodText)").font(.callout)
            }
            .padding(.vertical, Layout.PercentageChangeCard.verticalPadding)
            .padding(.horizontal, Layout.PercentageChangeCard.horizontalPadding)
            .background(percentageCardBackground))
    }

    enum ReturnsTimePeriod: String {
        case daily
        case allTime
    }

    private var percentageCardBackground: some View {
        //        RoundedRectangle(
        //            cornerRadius: Layout.PercentageChangeCardBackground.cornerRadius
        //        )
        Capsule()
            .fill(
                .primaryGreen.opacity(
                    Layout.PercentageChangeCardBackground.opacity
                )
            )
            .overlay(
                //            RoundedRectangle(
                //                cornerRadius: Layout.PercentageChangeCardBackground.cornerRadius
                //            )
                Capsule()
                    .strokeBorder(
                        LinearGradient.theme
                            .diagonalGradient(
                                fromColor: .primaryGreen,
                                toColor: .secondaryGray
                            ),
                        lineWidth: Layout.PercentageChangeCardBackground
                            .lineWidth
                    ).opacity(Layout.PercentageChangeCardBackground.opacity)

            )
    }

    private var homeCardBackground: some View {
        RoundedRectangle(cornerRadius: Layout.homeCardBackground.cornerRadius)
            .fill(
                LinearGradient.theme.diagonalGradient(
                    fromColor: .primaryWhite,
                    toColor: .secondaryGray
                ).opacity(Layout.homeCardBackground.fillOpacity)
            )
            .overlay(
                RoundedRectangle(
                    cornerRadius: Layout.homeCardBackground.cornerRadius
                )
                .strokeBorder(
                    LinearGradient.theme
                        .diagonalGradient(
                            fromColor: .primaryWhite,
                            toColor: .secondaryGray
                        ),
                    lineWidth: Layout.homeCardBackground.lineWidth
                ).opacity(Layout.PercentageChangeCardBackground.opacity)

            )
    }

}

private enum Layout {
    enum Divider {
        static let opacity: CGFloat = 0.5
    }

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

    enum homeCardBackground {
        static let cornerRadius: CGFloat = 16
        static let fillOpacity: CGFloat = 0.25
        static let strokeOpacity: CGFloat = 0.3
        static let lineWidth: CGFloat = 1
    }
}
