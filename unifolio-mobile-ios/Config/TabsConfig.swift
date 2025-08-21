//
//  TabsConfig.swift
//  unifolio-mobile-ios
//
//  Created by Francisco Manuel Gallegos Luque on 21/08/2025.
//

import Foundation
import SwiftUI

struct Tabs {
    static let defaultTabs = [
        TabBarItem(name: .home, image: .home),
        TabBarItem(name: .target, image: .target),
        TabBarItem(name: .upload, image: .upload),
        TabBarItem(name: .analytics, image: .analytics),
        TabBarItem(name: .more, image: .more)
    ]
}

struct TabBarItem: Hashable {
    let name: TabName
    let image: UIImage
}

enum TabName {
    case home
    case target
    case upload
    case analytics
    case more
}


