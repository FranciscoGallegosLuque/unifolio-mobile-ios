//
//  TripleToggleView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 25/08/2025.
//

import SwiftUI

struct FilterOption: Identifiable {
    let id: String

    init(name: String, displayName: String) {
        self.id = name
        self.name = name
        self.displayName = displayName
    }

    let name: String
    let displayName: String
}

struct TriplePicker: View {
    let filterOptions: [FilterOption]
    
//    @Binding var selectedFilterOption: FilterOption? = filterOptions.first ?? nil

    var body: some View {
        HStack(spacing: 1) {
            ForEach(filterOptions) { filterOption in
//                HStack {
                    Text(filterOption.displayName.capitalized)
                        .foregroundStyle(.primaryWhite)
                        .font(.callout)
                        .fontWeight(.light)
//                }
                .frame(maxWidth: .infinity)
                .frame(height: 32)
                .background(Color.red)
            }
        }
        
        
        .clipShape(Capsule())
    }
}

#Preview {
    TriplePicker(
        filterOptions: [
            FilterOption(name: "platform", displayName: "plataforma"),
            FilterOption(name: "risk", displayName: "Riesgo"),
            FilterOption(name: "asset", displayName: "Activo")
        ]
    )
}
