//
//  itemDetailViewModel.swift
//  easyShopper
//
//  Created by Oscar Navidad on 10/3/22.
//

import Foundation
import Stinsen

class itemDetailViewModel: ObservableObject {
   
    @Published var product: ProductRepresentable
    var router: AppCoordinator.Router? = RouterStore.shared.retrieve()
    
    private var cartManager: CartManager
    
    init(product: ProductRepresentable, cartManager: CartManager) {
        self.product = product
        self.cartManager = cartManager
    }
    
    func addToCart(product: ProductRepresentable) {
        cartManager.setItemInCart(product: product)
        NotificationCenter.default.post(name: NSNotification.Name("updateCart"), object: nil)
        router?.popToRoot()
    }
}
