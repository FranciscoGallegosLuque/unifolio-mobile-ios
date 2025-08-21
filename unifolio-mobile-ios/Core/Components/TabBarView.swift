//
//  TabBarView.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 20/08/2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        HStack(spacing: 40) {
            homeTabItem
            targetTabItem
            uploadTabItem
            analysisTabItem
            moreTabItem
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 25)
        .background(
            Capsule()
                .fill(Color.theme.secondaryBlack)
                .overlay(
                    Capsule()
                        .strokeBorder(strokeGradient, lineWidth: 1).opacity(0.3)
                )
            
        )
    }
}

#Preview {
    TabBarView()
}

extension TabBarView {
    private var homeTabItem: some View {
        VStack {
            Image(.home)
        }
    }

    private var targetTabItem: some View {
        VStack {
            Image(.target)
        }
    }

    private var uploadTabItem: some View {
        VStack {
            Image(.upload)
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(uploadFillGradient)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(strokeGradient, lineWidth: 1).opacity(0.3)
                )
                
           )
            
    }
    
    private var uploadFillGradient: LinearGradient {
        LinearGradient(
            colors: [
                 Color.theme.primaryPurple, Color.theme.secondaryViolet
            ],
            startPoint: .center,
            endPoint: .bottom
        )
    }
    
    private var strokeGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color.theme.primaryWhite, Color.theme.secondaryGray,
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    private var analysisTabItem: some View {
        VStack {
            Image(.barchart)
        }
    }
    
    private var moreTabItem: some View {
        VStack {
            Image(.more)
        }
    }
}

