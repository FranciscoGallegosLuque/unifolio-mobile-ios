//
//  HomeCardView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 22/08/2025.
//

import SwiftUI

struct HomeCardView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                amountSection
                returnsSections
            }
            .padding(.vertical)
            divider
            buttonsSection
        }
        .background(homeCardBackground)
    }
}

#Preview {
    HomeCardView()
}

extension HomeCardView {
    private var amountSection: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Dólares totales").font(.callout).fontWeight(
                    .semibold
                )
                Image(systemName: "chevron.down")
            }

            Text("USD 1895").font(.title).padding(.top)
        }
        .frame(maxWidth: .infinity)
    }

    private var returnsSections: some View {
        VStack(alignment: .leading) {
            Text("Rendimientos").font(.callout).fontWeight(.semibold)
            HStack {
                VStack(alignment: .leading) {
                    percentageChangeCard(change: 2)
                    Text("Diario").font(.callout).fontWeight(.light)
                }
                VStack(alignment: .leading) {
                    percentageChangeCard(change: 125)
                    Text("Histórico").font(.callout).fontWeight(.light)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private var buttonsSection: some View {
        HStack {
            Text("Movimiento").fixedSize().frame(maxWidth: .infinity)
                .padding(.vertical)
            divider
            Text("Más información").fixedSize().frame(maxWidth: .infinity)
                .padding(.vertical)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var divider: some View {
        Divider().overlay(.primaryWhite).opacity(Layout.Divider.opacity)
    }

    private func percentageChangeCard(change: Int) -> some View {
        HStack {
            Image(systemName: (change > 0) ? "arrow.up" : "arrow.down")
                .fontWeight(.bold)
                .font(.footnote)
                .foregroundStyle(
                    (change > 0)
                        ? Color.theme.primaryGreen : Color.theme.primaryPurple
                )
            Text("\(change)%").font(.callout)
        }
        .padding(Layout.PercentageChangeCard.padding)
        .background(percentageCardBackground)
    }

    private var percentageCardBackground: some View {
        RoundedRectangle(
            cornerRadius: Layout.PercentageChangeCardBackground.cornerRadius
        )
        .fill(
            .primaryGreen.opacity(Layout.PercentageChangeCardBackground.opacity)
        )
        .overlay(
            RoundedRectangle(
                cornerRadius: Layout.PercentageChangeCardBackground.cornerRadius
            )
            .strokeBorder(
                LinearGradient.theme
                    .diagonalGradient(
                        fromColor: .primaryGreen,
                        toColor: .secondaryGray
                    ),
                lineWidth: Layout.PercentageChangeCardBackground.lineWidth
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
        static let padding: CGFloat = 6
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
