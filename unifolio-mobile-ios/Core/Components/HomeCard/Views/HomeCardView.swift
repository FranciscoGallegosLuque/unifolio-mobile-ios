//
//  HomeCardView2.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 27/08/2025.
//

import SwiftUI

struct HomeCardMockData {
    let holdings: Double
    let dailyReturns: Double
    let allTimeReturns: Double
}

@Observable final class HomeCardViewModel {
    var mockData = HomeCardMockData(
        holdings: 1893.34,
        dailyReturns: -2.12451,
        allTimeReturns: 125.67451245
    )
}

struct HomeCardView: View {

    var vm = HomeCardViewModel()
    @State var showHoldings: Bool

    var body: some View {
        VStack(spacing: .zero) {
            overviewSection
            divider
            buttonsSection
        }
        .background(homeCardBackground)
    }
}

#Preview {
    HomeCardView(showHoldings: true)
}

#Preview {
    HomeCardView(showHoldings: false)
}

extension HomeCardView {

    private var overviewSection: some View {
        VStack(alignment: .leading, spacing: Layout.OverviewSection.spacing) {
            headerSection
            moneySection
            returnsSections
        }
        .padding(Layout.OverviewSection.padding)
    }

    private var headerSection: some View {
        HStack {
            Text("Dólares totales").font(.callout).fontWeight(.semibold)
            Spacer()
            Image(systemName: showHoldings ? "eye" : "eye.slash")
                .onTapGesture {
                    withAnimation(.linear(duration: 0.3)) {
                        showHoldings.toggle()
                    }
                }
        }
        .frame(height: 18)
    }

    @ViewBuilder
    private var moneySection: some View {
        HStack {
            Text("US$").font(.largeTitle).fontWeight(.bold)
            if showHoldings {
                moneyAmount
            } else {
                moneyHiddenAmount
            }
        }

    }

    private var moneyAmount: some View {
        HStack(alignment: .top, spacing: .zero) {
            Text(vm.mockData.holdings.asNumberStringWithoutDecimals()).font(
                .largeTitle
            ).fontWeight(.bold)
            Text(vm.mockData.holdings.asFirst2Decimals()).font(.title3)
                .fontWeight(.bold).frame(alignment: .top)
        }
    }

    private var moneyHiddenAmount: some View {
        HStack(spacing: .zero) {
            Text("***").font(.largeTitle).fontWeight(.bold)
        }
    }

    private var returnsSections: some View {
        HStack {
            ReturnsChangeCapsule(
                change: vm.mockData.dailyReturns,
                period: .daily
            )
            ReturnsChangeCapsule(
                change: vm.mockData.allTimeReturns,
                period: .allTime
            )
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

    private var buttonsSection: some View {
        Text("Movimientos")
            .padding(.vertical, 12)
    }

    private var divider: some View {
        Divider().overlay(.primaryWhite).opacity(Layout.Divider.opacity)
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
                ).opacity(Layout.homeCardBackground.strokeOpacity)

            )
    }

}

private enum Layout {
    enum OverviewSection {
        static let spacing: CGFloat = 15
        static let padding: CGFloat = 26
    }

    enum Divider {
        static let opacity: CGFloat = 0.5
    }

    enum homeCardBackground {
        static let cornerRadius: CGFloat = 16
        static let fillOpacity: CGFloat = 0.25
        static let strokeOpacity: CGFloat = 0.3
        static let lineWidth: CGFloat = 1
    }
}
