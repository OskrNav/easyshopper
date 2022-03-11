//
//  itemDetailView.swift
//  easyShopper
//
//  Created by Oscar Navidad on 8/3/22.
//

import SwiftUI

struct itemDetailView: View {
    
    @ObservedObject var viewModel: itemDetailViewModel
    
    init(viewModel: itemDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                topPanelView
                bodyPanelView
                Spacer()
                Button(action: { viewModel.addToCart(product: viewModel.product )}) {
                    Text("Add to cart")
                }
                .buttonStyle(RoundedRectangleButtonStyle())
            }
        }
        .padding()
    }
    
    var topPanelView: some View {
        VStack {
            AsyncImage(
                url: URL(string: viewModel.product.imageURL ),
              content: { image in
                  image.resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(maxWidth: 150, maxHeight: .infinity)
                      .clipped()
              },
              placeholder: {
                  ZStack {
                      Image(systemName: "nosign")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 200)
                      ProgressView()
                  }
              }
            )
            
            Text("\(viewModel.product.name)")
                .font(.title2)
            
        }
    }
    
    var bodyPanelView: some View {
        VStack(alignment: .leading) {
            Text("\(viewModel.product.productsDescription)")
                .font(.body)
            HStack {
                Text("Price:")
                    .bold()
                Text("$\(viewModel.product.costPrice)")
                    .bold()
            }
            .padding(.vertical, 20)
        }
        .padding(8)
    }
}

struct itemDetailView_Previews: PreviewProvider {
    
    @State static var product = ProductRepresentable(barcode: "fsadf", id: "fdfa", imageURL: "fdasf", name: "fdafa", costPrice: 1, productsDescription: "dfadfadsf")
    
    static var previews: some View {
        itemDetailView(viewModel: itemDetailViewModel(product: product, cartManager: CartManager()))
    }
}
