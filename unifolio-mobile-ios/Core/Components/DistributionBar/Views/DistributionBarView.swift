//
//  HoldingsDistributionBarView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 24/08/2025.
//

import SwiftUI

struct DistributionBarEntity: Identifiable {
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


struct MockData {
    static let mockPlatforms: [DistributionBarEntity] = [
        DistributionBarEntity(name: "Binance", color: .primaryPurple, percentage: 0.3),
        DistributionBarEntity(name: "Balanz", color: .secondaryBlue, percentage: 0.4),
        DistributionBarEntity(name: "Cocos", color: .secondaryViolet, percentage: 0.2),
        DistributionBarEntity(name: "Otros", color: .primaryGreen, percentage: 0.1),
    ]

    static let mockRisk: [DistributionBarEntity] = [
        DistributionBarEntity(name: "Bajo", color: .primaryBlue, percentage: 0.3),
        DistributionBarEntity(name: "Medio", color: .secondaryBlue, percentage: 0.5),
        DistributionBarEntity(name: "Alto", color: .primaryGreen, percentage: 0.2),
    ]
    
    static let mockAsset: [DistributionBarEntity] = [
        DistributionBarEntity(name: "Cripto", color: .primaryBlue, percentage: 0.45),
        DistributionBarEntity(name: "Bonos", color: .secondaryBlue, percentage: 0.25),
        DistributionBarEntity(name: "Cash", color: .primaryGreen, percentage: 0.3),
    ]
}

struct DistributionBarView: View {

    var filter: DistributionBarFilter
    let data: [DistributionBarEntity]
    private var numberOfEntities: Int { data.count }
    
    init(filter: DistributionBarFilter = .platform) {
        self.filter = filter
        let displayedData = displayedData(by: filter)
        self.data = displayedData
        
        func displayedData(by filter: DistributionBarFilter) -> [DistributionBarEntity] {
            switch filter {
            case .platform:
                return MockData.mockPlatforms
            case .risk:
                return MockData.mockRisk
            case .asset:
                return MockData.mockAsset
            }
        }
    }

    var body: some View {
        VStack(spacing: Layout.Body.spacing) {
            bar
            labels
        }
    }
}

#Preview {
    DistributionBarView()
}

extension DistributionBarView {
    
    

    private var bar: some View {
        GeometryReader { geometry in
            HStack(spacing: Layout.Bar.spacing) {
                ForEach(data) { entity in
                    entity.color.frame(
                        width: geometry.size.width * entity.percentage
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
        if numberOfEntities > position {
            barLabel(for: data[position])
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

    private func barLabel(for entity: DistributionBarEntity) -> some View {
        HStack(spacing: Layout.BarLabel.spacing) {
            Image(systemName: "circle.fill").foregroundStyle(entity.color)
            Text(
                "\(entity.name) | \((entity.percentage * 100).formatted(.number))%"
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
