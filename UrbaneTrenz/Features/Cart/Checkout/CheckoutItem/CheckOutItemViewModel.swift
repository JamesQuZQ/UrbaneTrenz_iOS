//
//  CheckOutItemViewModel.swift
//  UrbaneTrenz
//


import Foundation

class CheckoutItemViewModel : ObservableObject {
    @Published var cartItem : CartItem
    
    init(cartItem: CartItem) {
        self.cartItem = cartItem
    }
}
