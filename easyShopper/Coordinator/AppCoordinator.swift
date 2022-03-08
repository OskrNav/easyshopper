//
//  AppCoordinator.swift
//  easyShopper
//
//  Created by Oscar Navidad on 7/3/22.
//

import Foundation
import SwiftUI
import Stinsen

final class AppCoordinator: NavigationCoordinatable {
    
    let stack = NavigationStack(initial: \AppCoordinator.start)
    
    @Root var start = makeMainView
    @Route(.push) var itemDetail = makeDetailView
    
    func makeMainView() -> some View {
        mainView()
    }
    
    func makeDetailView() -> some View {
        itemDetailView()
    }
}
