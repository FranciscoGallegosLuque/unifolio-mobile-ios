//
//  Color.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 20/08/2025.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let primaryBlack = Color("PrimaryBlackColor")
    let primaryBlue = Color("PrimaryBlueColor")
    let primaryGreen = Color("PrimaryGreenColor")
    let primaryPurple = Color("PrimaryPurpleColor")
    let primaryWhite = Color("PrimaryWhiteColor")
    
    let secondaryBlack = Color("SecondaryBlackColor")
    let secondaryBlue = Color("SecondaryBlueColor")
    let secondaryGray = Color("SecondaryGrayColor")
    let secondaryViolet = Color("SecondaryVioletColor")
}

