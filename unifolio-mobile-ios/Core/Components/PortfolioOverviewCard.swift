//
//  PortfolioOverviewCard.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 26/08/2025.
//

import SwiftUI

struct Asset: Identifiable {
    let ticker: String
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

struct PortfolioOverviewCard: View {

    @State private var assets: [Asset] = [
        Asset(
            ticker: "BTC",
            change: 1000,
            investment: 100000,
            marketValue: 110000
        ),
        Asset(ticker: "ETH", change: 100, investment: 2000, marketValue: 2100),
        Asset(ticker: "XRP", change: 50, investment: 100, marketValue: 150),
        Asset(ticker: "SOL", change: -1, investment: 3, marketValue: 2),
    ]

    @State private var mockTitles = [
        "Ticker", "Variación", "Inversión", "Actual",
    ]

    var body: some View {
        VStack(spacing: 0) {

            HStack {
                Text("Binance")
                Spacer()
                Image(systemName: "chevron.down")
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14.5)
            .background(.primaryPurple)
            ExDivider(gradient: gradient, width: 1, opacity: 0.3)
            titlesHeader

            ForEach(assets) { asset in
                ExDivider(gradient: gradient, width: 1, opacity: 0.3)
                row(asset: asset)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .border(gradient.opacity(0.3), width: 0.5)
    }
}

#Preview {
    PortfolioOverviewCard()
}

extension PortfolioOverviewCard {

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
        .background(Color.secondaryBlack)
    }

    private func row(asset: Asset) -> some View {
        HStack {
            HStack {
                Text(asset.ticker)
                Text(asset.change.asPesoCurrencyWith2Decimals())
                Text(asset.investment.asPesoCurrencyWith2Decimals())
                Text(asset.marketValue.asPesoCurrencyWith2Decimals())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
        }
        .frame(height: 38)
        .background(Color.secondaryBlack)
        //        .border(gradient.opacity(0.3), width: 1)
    }

    private var gradient: LinearGradient {
        LinearGradient(
            colors: [.primaryWhite, .secondaryGray],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
