//
//  HomeView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 20/08/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HomeCardView()
            DistributionBarSectionView()
                .padding(.top, 40)
            
        }
    }
}

#Preview {
    HomeView()
}
