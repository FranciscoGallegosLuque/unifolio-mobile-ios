//
//  PortfolioOverviewCard.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 26/08/2025.
//

import SwiftUI

struct Asset: Identifiable {
    let ticker: String
    let tickerPrice: Double
    let change: Double
    let investment: Double
    let marketValue: Double

    let id = UUID()
}

struct ExDivider: View {
    let gradient: LinearGradient
    let width: CGFloat
    let opacity: CGFloat
    var body: some View {
        Rectangle()
            .fill(gradient)
            .frame(height: width)
            .opacity(opacity)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct PortfolioOverviewTable: View {

    @State private var assets: [Asset] = [
        Asset(
            ticker: "BTC",
            tickerPrice: 111329.33,
            change: 2.3451,
            investment: 100000,
            marketValue: 110000
        ),
        Asset(
            ticker: "ETH",
            tickerPrice: 4590.34,
            change: 4.24145,
            investment: 2000,
            marketValue: 2100
        ),
        Asset(
            ticker: "XRP",
            tickerPrice: 3.0254,
            change: -1.2344,
            investment: 100,
            marketValue: 150
        ),
        Asset(
            ticker: "SOL",
            tickerPrice: 111329.33,
            change: 0.2345,
            investment: 3,
            marketValue: 2
        ),
    ]

    @State private var mockTitles = [
        "Ticker", "Var. diaria", "Inv. inicial", "Valor actual",
    ]

    var body: some View {
        VStack(spacing: 0) {

            HStack {
                Text("Binance").fontWeight(.medium)
                Spacer()
                HStack(spacing: 5) {
                    Text("Ver detalle")
                    Image(systemName: "chevron.right")
                }
                .font(.caption2)
                .fontWeight(.medium)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(.primaryPurple)

            ExDivider(gradient: gradient, width: 1, opacity: 0.3)
            titlesHeader
            ForEach(assets) { asset in
                ExDivider(gradient: gradient, width: 1, opacity: 0.3)
                row(asset: asset)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(
                cornerRadius: Layout.tableBackground.cornerRadius
            )
            .strokeBorder(
                LinearGradient.theme
                    .diagonalGradient(
                        fromColor: .primaryWhite,
                        toColor: .secondaryGray
                    ),
                lineWidth: Layout.tableBackground.lineWidth
            ).opacity(Layout.tableBackground.opacity)
        )
    }
}

#Preview {
    PortfolioOverviewTable()
}

extension PortfolioOverviewTable {

    private var titlesHeader: some View {
        HStack {
            HStack {
                ForEach(mockTitles, id: \.self) { title in
                    Text(title).font(.caption).fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.leading, 16)
        }
        .frame(height: 38)
        .background(Color.primaryBlack)
    }

    private func row(asset: Asset) -> some View {

        let isChangePositive: Bool = asset.change > .zero

        return
            (HStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(asset.ticker).fontWeight(.bold)
                        Text(asset.tickerPrice.asPesoCurrencyWith2Decimals())
                            .font(
                                .system(size: 8)
                            ).fontWeight(.light)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text(asset.change.asPercentString()).frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .foregroundStyle(
                        isChangePositive ? .primaryGreen : .tertiaryRed
                    )

                    Text(asset.investment.asPesoCurrencyWith2Decimals()).frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    Text(asset.marketValue.asPesoCurrencyWith2Decimals()).frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                }
                .font(.caption2)
                .padding(.leading, 16)
            }
            .frame(height: 38)
            .background(Color.primaryBlack))
    }

    private var gradient: LinearGradient {
        LinearGradient(
            colors: [.primaryWhite, .secondaryGray],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    private var tableBackground: some View {
        RoundedRectangle(cornerRadius: Layout.tableBackground.cornerRadius)
            .overlay(
                RoundedRectangle(
                    cornerRadius: Layout.tableBackground.cornerRadius
                )
                .strokeBorder(
                    LinearGradient.theme
                        .diagonalGradient(
                            fromColor: .primaryWhite,
                            toColor: .secondaryGray
                        ),
                    lineWidth: Layout.tableBackground.lineWidth
                ).opacity(Layout.tableBackground.opacity)

            )
    }
}

private enum Layout {
    enum tableBackground {
        static let cornerRadius: CGFloat = 16
        static let lineWidth: CGFloat = 1
        static let opacity: CGFloat = 0.3
    }
}
