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
    let marketValue: Int
    
    let id = UUID()
}



struct PortfolioOverviewCard: View {
    
    @State private var assets: [Asset] = [
        Asset(ticker: "BTC", change: 1000, investment: 100000, marketValue: 110000),
        Asset(ticker: "ETH", change: 100, investment: 2000, marketValue: 2100),
        Asset(ticker: "XRP", change: 50, investment: 100, marketValue: 150),
        Asset(ticker: "SOL", change: -1, investment: 3, marketValue: 2),
    ]
    
    @State private var mockTitles = ["Ticker", "Variación", "Inversión", "Actual"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Binance")
                Spacer()
                Image(systemName: "chevron.down")
            }
            .padding(.horizontal, 16)
            titlesHeader
            ForEach(assets) { asset in
                row(asset: asset)
            }
        }
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
                Text("\(asset.change)")
                Text("\(asset.investment)")
                Text("\(asset.marketValue)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
        }
        .frame(height: 38)
        .background(Color.secondaryBlack)
    }
}
