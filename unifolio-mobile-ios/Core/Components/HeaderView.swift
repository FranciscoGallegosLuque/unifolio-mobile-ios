//
//  HeaderView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 21/08/2025.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: TabBarItem
    let homeTab = TabBarItem(name: .home, image: .home)
    let userName = "Juan Pérez"
    
    var body: some View {
        HStack {
            HStack(spacing: Layout.Header.spacing) {
                Image(.logoLight)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        selectedTab = homeTab
                    }
                VStack(alignment: .leading, spacing: Layout.Greeting.spacing) {
                    Text("Hola,")
                    Text(userName).fontWeight(.semibold)
                }
                .foregroundStyle(.primaryWhite)
            }
            .padding(.vertical, Layout.Header.padding)
            Spacer()
            iconButton(icon: "bell")
            iconButton(icon: "person")

        }
        .frame(height: Layout.Header.frameHeight)
    }
}

#Preview {
    HeaderView(selectedTab: .constant(TabBarItem(name: .home, image: .home)))
}

extension HeaderView {

    private func iconButton(icon: String) -> some View {
        Image(systemName: icon)
            .foregroundStyle(.primaryWhite)
            .padding(Layout.IconButton.padding)
            .background(
                RoundedRectangle(cornerRadius: Layout.IconButton.cornerRadius)
                    .fill(
                        Color.theme.primaryWhite.opacity(
                            Layout.IconButton.opacity
                        )
                    )
                    .overlay(
                        RoundedRectangle(
                            cornerRadius: Layout.IconButton.cornerRadius
                        )
                        .strokeBorder(
                            LinearGradient.theme.diagonalGradient(fromColor: .primaryWhite, toColor: .secondaryGray),
                            lineWidth: Layout.IconButton.strokeLineWidth
                        ).opacity(Layout.IconButton.opacity)
                    )
            )
    }
}

private enum Layout {
    enum Header {
        static let spacing: CGFloat = 15
        static let padding: CGFloat = 6.5
        static let frameHeight: CGFloat = 40
    }
    
    enum Greeting {
        static let spacing: CGFloat = 0
    }
    
    enum IconButton {
        static let padding: CGFloat = 10
        static let cornerRadius: CGFloat = 13
        static let opacity: CGFloat = 0.3
        static let strokeLineWidth: CGFloat = 1.11
    }
}
