//
//  ProductsViewModel.swift
//  easyShopper
//
//  Created by Oscar Navidad on 10/3/22.
//

import Foundation
import Combine

class productsViewModel: ObservableObject {
    
    @Published var products: [ProductRepresentable] = []
    
    private var service: ProductServiceType
    private var cancellable = Set<AnyCancellable>()
    
    init(service: ProductServiceType = ProductService()) {
        self.service = service
    }
    
    func getProducts() {
        service.getProducts()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { [weak self] products in
                self?.buildDomainModelProducts(data: products)
            })
            .store(in: &cancellable)
    }
    
    func buildDomainModelProducts(data: Products) {
        products = data.compactMap{ ProductRepresentable.init(barcode: $0.value.barcode,
                                                              id: $0.value.id,
                                                              imageURL: $0.value.imageURL,
                                                              name: $0.value.name,
                                                              costPrice: $0.value.costPrice ?? 0 )}
    }
}
