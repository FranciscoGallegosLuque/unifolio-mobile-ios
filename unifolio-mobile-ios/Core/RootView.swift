//
//  RootView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 21/08/2025.
//

import SwiftUI

struct RootView: View {
    
    @State private var selectedTab: TabBarItem = Tabs.defaultTabs.first!
    
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            TabBarView(selection: $selectedTab)
        }
        .background(Image(.background))
    }
}

#Preview {
    RootView()
}



