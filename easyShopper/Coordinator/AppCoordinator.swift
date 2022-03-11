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
    let cart = CartManager()
    
    @Root var start = makeMainView
    @Route(.fullScreen) var goProducts = makeProductView
    @Route(.fullScreen) var itemDetail = makeDetailView
    
    
    @ViewBuilder func makeMainView() -> some View {
        mainView(viewModel: .init(cartManager: cart))
    }
    
    @ViewBuilder func makeProductView() -> some View {
        ProductsView(viewModel: productsViewModel())
    }
    
    @ViewBuilder func makeDetailView(for product: ProductRepresentable) -> some View {
        let viewModel = itemDetailViewModel(product: product, cartManager: cart)
        itemDetailView(viewModel: viewModel)
    }
    
    
}
