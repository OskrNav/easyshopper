//
//  ProductsView.swift
//  easyShopper
//
//  Created by Oscar Navidad on 10/3/22.
//

import SwiftUI

struct ProductsView: View {
    
    @EnvironmentObject var router: AppCoordinator.Router
    @ObservedObject var viewModel: productsViewModel
    
    private var columns: [GridItem] = [
        GridItem(.flexible(minimum: 150)),
        GridItem(.flexible(minimum: 150)),
        ]
    
    init(viewModel: productsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.products, id: \.self) { product in
                        ProductCell(product: product)
                            .onTapGesture {
                                router.route(to: \.itemDetail, product)
                            }
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.getProducts()
        })
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView(viewModel: productsViewModel())
    }
}
