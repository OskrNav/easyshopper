//
//  ProductCell.swift
//  easyShopper
//
//  Created by Oscar Navidad on 10/3/22.
//

import SwiftUI

struct ProductCell: View {
    
    var product: ProductRepresentable
    
    
    var body: some View {
        VStack {
            AsyncImage(
              url: URL(string: product.imageURL ),
              content: { image in
                  image.resizable()
                      .aspectRatio(contentMode: .fit)
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
            Text(product.name)
                .font(.subheadline)
                .lineLimit(2)
        }
    }
}
