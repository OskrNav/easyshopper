//
//  itemDetailViewModel.swift
//  easyShopper
//
//  Created by Oscar Navidad on 10/3/22.
//

import Foundation

class itemDetailViewModel: ObservableObject {
   
    @Published var product: ProductRepresentable
    
    init(product: ProductRepresentable) {
        self.product = product
    }
}
