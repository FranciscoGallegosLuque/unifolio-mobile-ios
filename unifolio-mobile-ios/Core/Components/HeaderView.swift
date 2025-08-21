//
//  HeaderView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 21/08/2025.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(.logoLight)
                .resizable()
                .scaledToFit()
            VStack(alignment: .leading) {
                Text("Hola,")
                Text("Juan Pérez").fontWeight(.semibold)
            }
            Spacer()
            bellButton

        }
        .frame(height: 50)
    }
}

#Preview {
    HeaderView()
}

extension HeaderView {
    private var bellButton: some View {
        Image(systemName: "bell")
            .foregroundStyle(.primaryWhite)
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 13)
                    .fill(Color.theme.primaryWhite.opacity(0.3))
                    .overlay(
                        RoundedRectangle(cornerRadius: 13)
                            .strokeBorder(LinearGradient.theme.strokeGradient, lineWidth: 1.11).opacity(0.3)
                    )
            )
    }
}
