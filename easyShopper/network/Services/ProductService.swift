//
//  ProductService.swift
//  easyShopper
//
//  Created by Oscar Navidad on 10/3/22.
//

import Foundation
import Combine


protocol HasProductService {
    var ProductService: ProductServiceType { get }
}

protocol ProductServiceType {
    func getProducts() -> AnyPublisher<Products, Error>
}

struct ProductService: ProductServiceType {
    
    let requester = NetworkingCombineRequester()
    
    func getProducts() -> AnyPublisher<Products, Error> {
        requester.execute(request: ProductsRequest.getProducts)
    }
}
