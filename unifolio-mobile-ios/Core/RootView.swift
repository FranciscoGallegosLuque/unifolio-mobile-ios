//
//  RootView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 21/08/2025.
//

import SwiftUI

struct RootView: View {
    
    @State private var selectedTab: TabBarItem = TabBarItem(name: .home, image: .home)
    
    var body: some View {
        VStack {
            HeaderView(selectedTab: $selectedTab)
                .padding(.horizontal, Layout.Header.spacing)
            ScrollView {
                HomeView()
            }
            TabBarView(selectedTab: $selectedTab)
        }
        .background(Image(.background))
    }
}

#Preview {
    RootView()
}

private enum Layout {
    enum Header {
        static let spacing: CGFloat = 10
    }
}



