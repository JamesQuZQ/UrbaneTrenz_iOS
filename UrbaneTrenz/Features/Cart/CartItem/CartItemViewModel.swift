//
//  CartItemViewModel.swift
//  UrbaneTrenz
//

import Foundation

class CartItemViewModel : ObservableObject {
    @Published var cartItem : CartItem
    var cartViewModel : CartViewModel

    init(cartItem : CartItem, cartViewModel : CartViewModel){
        self.cartItem = cartItem
        self.cartViewModel = cartViewModel
    }
    
    func removeItem() {
        CartDAO.deleteFromCart(product: cartItem.product)
        cartViewModel.getCart()
    }
    
    func increaseItemCount() {
        CartDAO.modifyProductQuantity(product: cartItem.product, newCount: cartItem.productCount + 1)
        cartViewModel.getCart()
    }
    
    func decreaseItemCount() {
        CartDAO.modifyProductQuantity(product: cartItem.product, newCount: cartItem.productCount - 1)
        cartViewModel.getCart()
    }
}
