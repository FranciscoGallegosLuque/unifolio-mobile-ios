//
//  TabBarView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 20/08/2025.
//

import SwiftUI

struct TabBarView: View {

    @Binding var selection: TabBarItem

    var body: some View {

        HStack(spacing: 40) {
            ForEach(Tabs.defaultTabs, id: \.self) { tab in
                Button {
                    selection = tab
                } label: {
                    tabView(tab: tab)
                }
                .tint(selection == tab ? .secondaryViolet : .secondaryGray)
            }
        }
        .tabBarModifier()
        
    }
}

#Preview {
    TabBarView(selection: .constant(TabBarItem(name: .home, image: .home)))
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
            selection = tab
        }
    }
}




