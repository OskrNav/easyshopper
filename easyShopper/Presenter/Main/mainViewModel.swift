//
//  mainViewModel.swift
//  easyShopper
//
//  Created by Oscar Navidad on 9/3/22.
//

import Combine

class mainViewModel: ObservableObject {
    
    @Published var productsInCart: Products = [:]
}
