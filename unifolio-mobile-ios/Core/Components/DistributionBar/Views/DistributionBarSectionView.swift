//
//  HoldingsDistributionBarToggleView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 25/08/2025.
//

import SwiftUI

struct DistributionBarSectionView: View {
    @State private var filter: DistributionBarFilter = .platform
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .primaryPurple
    }

    var body: some View {
        VStack(spacing: Layout.spacing) {
            toggle
            DistributionBarView(filter: filter)
        }
    }
}

#Preview {
    DistributionBarSectionView()
}

enum DistributionBarFilter: String, CaseIterable, Identifiable {
    case platform
    case risk
    case asset

    var id: Self { self }
}

extension DistributionBarSectionView {
    func toggleText(filter: DistributionBarFilter) -> String {
        switch filter {
        case .platform:
            return "Plataforma"
        case .risk:
            return "Riesgo"
        case .asset:
            return "Activo"
        }
    }
    
    private var toggle: some View {
        Picker("State", selection: $filter) {
            ForEach(DistributionBarFilter.allCases) { filter in

                Text(toggleText(filter: filter))
                    .tag(filter.rawValue)
            }
        }
        .pickerStyle(.segmented)
    }
}

private enum Layout {
    static let spacing: CGFloat = 32
}
