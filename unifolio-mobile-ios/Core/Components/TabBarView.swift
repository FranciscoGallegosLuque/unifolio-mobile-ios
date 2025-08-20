//
//  TabBarView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 20/08/2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        upload
    }
}

#Preview {
    TabBarView()
}

extension TabBarView {
    private var home: some View {
        VStack {
            Image(.home)
        }
    }

    private var target: some View {
        VStack {
            Image(.target)
        }
    }

    private var upload: some View {
        VStack {
            Image(.upload)
        }
        .padding()
        .background(uploadGradient)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var uploadGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color.theme.secondaryViolet, Color.theme.primaryPurple,
            ],
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
    }

    private var barchart: some View {
        VStack {
            Image(.barchart)
        }
    }
}

