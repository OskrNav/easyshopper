//
//  mainView.swift
//  easyShopper
//
//  Created by Oscar Navidad on 8/3/22.
//

import SwiftUI

struct mainView: View {
    
    @EnvironmentObject var router: AppCoordinator.Router
    @ObservedObject var viewModel: mainViewModel
    
    var body: some View {
        VStack {
            Text("Shopping Cart")
                .font(.title)
            if viewModel.productsInCart.isEmpty {
                emptyView
            }else {
                cartList
            }
            
            Button(action: {
                router.route(to: \.goProducts)
            }) {
                Text("Products")
            }
            .buttonStyle(RoundedRectangleButtonStyle())
        }
        .padding(20)
    }
    
    
    var titleView: some View {
        Text("Shopping cart")
            .font(.largeTitle)
    }
    
    var emptyView: some View {
        VStack {
            Spacer()
            Image(systemName: "cart.circle.fill")
                .resizable()
                .foregroundColor(Color.red)
                .frame(width: 100, height: 100)
            Text("No items in cart")
            Spacer()
        }
    }
    
    var cartList: some View {
        VStack{
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(viewModel.productsInCart, id: \.id){ product in
                        HStack {
                            Text("\(product.qty)")
                            Text(" X ")
                            Text("\(product.name)")
                            Spacer()
                            Text("$\(product.price)")
                        }
                        Divider()
                    }
                }
            }
        }
        .padding()
    }
    
}

struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.white)
      Spacer()
    }
    .padding()
    .background(Color.red.cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}


struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView(viewModel: mainViewModel(cartManager: CartManager()))
    }
}
