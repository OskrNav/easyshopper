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
            if viewModel.productsInCart.isEmpty {
                emptyView
            }else {
                
            }
            
            Button(action: {
                router.route(to: \.goProducts )
                
            }) {
                Text("Products")
            }
        }
        .navigationTitle("Shopping Cart")
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
    
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView(viewModel: mainViewModel())
    }
}
