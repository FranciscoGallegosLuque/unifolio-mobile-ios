//
//  HoldingsDistributionBarToggleView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 25/08/2025.
//

import SwiftUI

struct DistributionBarSectionView: View {
    @State private var filter: FilterOption
    private let filterOptions: [FilterOption]
    
    init() {
        let emptyFilterOption = FilterOption(name: "", displayName: "")
        self.filterOptions = [
            FilterOption(name: DistributionBarFilterOptions.platform.rawValue, displayName: "plataforma"),
            FilterOption(name: DistributionBarFilterOptions.risk.rawValue, displayName: "riesgo"),
            FilterOption(name: DistributionBarFilterOptions.asset.rawValue, displayName: "activo")
        ]
        self._filter = State(wrappedValue: filterOptions.first ?? emptyFilterOption)
    }
    

    var body: some View {
        VStack(spacing: Layout.spacing) {
            picker
            DistributionBarView(filter: filter)
        }
    }
}

#Preview {
    DistributionBarSectionView()
}

enum DistributionBarFilterOptions: String, CaseIterable, Identifiable {
    case platform
    case risk
    case asset

    var id: Self { self }
}

extension DistributionBarSectionView {
    func toggleText(filter: DistributionBarFilterOptions) -> String {
        switch filter {
        case .platform:
            return "Plataforma"
        case .risk:
            return "Riesgo"
        case .asset:
            return "Activo"
        }
    }
    
    
    
    private var picker: some View {
        TriplePicker(filterOptions: filterOptions, selectedFilterOption: $filter)
    }
}

private enum Layout {
    static let spacing: CGFloat = 32
}
