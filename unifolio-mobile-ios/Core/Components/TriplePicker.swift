//
//  TripleToggleView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 25/08/2025.
//

import SwiftUI

struct FilterOption: Identifiable, Equatable, Hashable {
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
    @Binding var selectedFilterOption: FilterOption

    var body: some View {
        HStack(spacing: 1) {
            ForEach(filterOptions) { filterOption in
                Text(filterOption.displayName.capitalized)
                    .foregroundStyle(.primaryWhite)
                    .font(.callout)
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity)
                    .frame(height: 32)
                    .background(
                        selectedFilterOption == filterOption
                            ? .primaryPurple : .secondaryBlack
                    )
                    .onTapGesture {
                        withAnimation {
                            selectedFilterOption = filterOption
                        }
                    }
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
            FilterOption(name: "asset", displayName: "Activo"),
        ],
        selectedFilterOption: .constant(
            FilterOption(name: "platform", displayName: "plataforma")
        )
    )
}
