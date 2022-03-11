//
//  mainViewModel.swift
//  easyShopper
//
//  Created by Oscar Navidad on 9/3/22.
//

import Combine
import Foundation

class mainViewModel: ObservableObject {
    
    @Published var productsInCart: [Cart] = []
    
    private var cartManager: CartManager
    
    init(cartManager: CartManager) {
        self.cartManager = cartManager
        productsInCart = cartManager.getItemInCart()
        NotificationCenter.default.addObserver(self, selector: #selector(updateCart), name: NSNotification.Name("updateCart"), object: nil)
    }
    
    @objc func updateCart() {
        productsInCart = cartManager.getItemInCart()
    }
    
}
