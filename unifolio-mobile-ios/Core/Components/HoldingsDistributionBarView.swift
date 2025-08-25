//
//  HoldingsDistributionBarView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 24/08/2025.
//

import SwiftUI

struct Holding: Identifiable {
    let id: String
    let name: String
    let color: Color
    let percentage: Double

    init(name: String, color: Color, percentage: Double) {
        self.id = name
        self.name = name
        self.color = color
        self.percentage = percentage
    }

}

struct HoldingsDistributionBarView: View {

    private var holdingsAmount: Int { mockHoldings.count }

    @State private var mockHoldings: [Holding] = [
        Holding(name: "Binance", color: .primaryPurple, percentage: 0.3),
        Holding(name: "Balanz", color: .secondaryBlue, percentage: 0.4),
        Holding(name: "Cocos", color: .secondaryViolet, percentage: 0.2),
        Holding(name: "Otros", color: .primaryGreen, percentage: 0.1),
    ]

    var body: some View {
        VStack(spacing: Layout.Body.spacing) {
            bar
            labels
        }
    }
}

#Preview {
    HoldingsDistributionBarView()
}

extension HoldingsDistributionBarView {

    private var bar: some View {
        GeometryReader { geometry in
            HStack(spacing: Layout.Bar.spacing) {
                ForEach(mockHoldings) { holding in
                    holding.color.frame(
                        width: geometry.size.width * holding.percentage
                    )
                }
            }
        }
        .clipShape(Capsule())
        .frame(height: Layout.Bar.height)
    }

    private var labels: some View {
        GeometryReader { geometry in
            HStack(spacing: Layout.Labels.spacing) {
                conditionalBarLabel(at: 0)
                Spacer()
                conditionalBarLabel(at: 1)
                Spacer()
                conditionalBarLabel(at: 2)
                Spacer()
                conditionalBarLabel(at: 3)
            }

        }
        .frame(height: Layout.Labels.height)
    }

    @ViewBuilder
    private func conditionalBarLabel(at position: Int) -> some View {
        if holdingsAmount > position {
            barLabel(for: mockHoldings[position])
        } else {
            placerHolderLabel
        }
    }

    private var placerHolderLabel: some View {
        HStack {
            EmptyView()
        }
        .frame(
            width: Layout.PlacerHolderLabel.width,
            height: Layout.PlacerHolderLabel.height
        )
    }

    private func barLabel(for holding: Holding) -> some View {
        HStack(spacing: Layout.BarLabel.spacing) {
            Image(systemName: "circle.fill").foregroundStyle(holding.color)
            Text(
                "\(holding.name) | \((holding.percentage * 100).formatted(.number))%"
            )
        }
        .font(.caption2)

    }

}

private enum Layout {
    enum Body {
        static let spacing: CGFloat = 16
    }

    enum Bar {
        static let spacing: CGFloat = 0
        static let height: CGFloat = 32
    }

    enum Labels {
        static let spacing: CGFloat = 0
        static let height: CGFloat = 14
    }

    enum PlacerHolderLabel {
        static let width: CGFloat = 70
        static let height: CGFloat = 14
    }

    enum BarLabel {
        static let spacing: CGFloat = 4
    }
}
