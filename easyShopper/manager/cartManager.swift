//
//  cartManager.swift
//  easyShopper
//
//  Created by Oscar Navidad on 10/3/22.
//

import Foundation

class CartManager {
    
    private var selectedItems: [ProductRepresentable] = []
    
    func setItemInCart(product: ProductRepresentable) {
        self.selectedItems.append(product)
    }
    
    func getItemInCart() -> [ProductRepresentable] {
        selectedItems
    }
}
