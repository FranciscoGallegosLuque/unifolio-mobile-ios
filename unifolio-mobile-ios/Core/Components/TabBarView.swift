//
//  TabBarView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 20/08/2025.
//

import SwiftUI

struct TabBarView: View {

    @Binding var selectedTab: TabBarItem

    var body: some View {

        HStack(spacing: 40) {
            ForEach(Tabs.defaultTabs, id: \.self) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    tabView(tab: tab)
                }
                .tint(selectedTab == tab ? .secondaryPurple : .secondaryGray)
            }
        }
        .tabBarModifier()
        
    }
}

#Preview {
    TabBarView(selectedTab: .constant(TabBarItem(name: .home, image: .home)))
}

extension TabBarView {
    @ViewBuilder
    private func tabView(tab: TabBarItem) -> some View {
        if tab.name == .upload {
            VStack {
                Image(uiImage: tab.image)
            }
            .uploadButtonModifier()
        } else {
            VStack {
                Image(uiImage: tab.image)
            }
        }
    }

    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selectedTab = tab
        }
    }
}




