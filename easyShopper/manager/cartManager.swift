//
//  cartManager.swift
//  easyShopper
//
//  Created by Oscar Navidad on 10/3/22.
//

import Foundation

class CartManager: ObservableObject {
    
    @Published var selectedItems: [Cart] = []
    
    func setItemInCart(product: ProductRepresentable) {
        
        if let index = selectedItems.firstIndex(where: { $0.id == product.id}) {
            selectedItems[index].qty = selectedItems[index].qty + 1
        }else {
            let productCart = Cart(id: product.id, qty: 1, price: product.costPrice, name: product.name)
            self.selectedItems.append(productCart)
        }
    }
    
    func getItemInCart() -> [Cart] {
        selectedItems
    }
    
    func removeItemInCart(item: ProductRepresentable) {
        selectedItems = selectedItems.filter({ $0.id != item.id })
    }
}


