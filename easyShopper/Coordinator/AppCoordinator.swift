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
    @Route(.fullScreen) var goProducts = makeProductView
    @Route(.fullScreen) var itemDetail = makeDetailView
    
    
    @ViewBuilder func makeMainView() -> some View {
        mainView(viewModel: .init())
    }
    
    @ViewBuilder func makeProductView() -> some View {
        ProductsView()
    }
    
    @ViewBuilder func makeDetailView() -> some View {
        itemDetailView()
    }
    
    
}
