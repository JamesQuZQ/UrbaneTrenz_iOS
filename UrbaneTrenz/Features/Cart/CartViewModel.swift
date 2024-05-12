//
//  CartViewModel.swift
//  UrbaneTrenz

import Foundation
import Alamofire
import SwiftyJSON

class CartViewModel : ObservableObject {
    
    @Published var cart : [CartItem] = []
    @Published var presentCheckout : Bool = false
    
    init() {
        getCart()
    }
    
    func getCart() {
        CartDAO.createCart()
        cart = CartDAO.readFromCart()
    }
    
    func calculateTotal() -> String {
        return String(format: "%.2f", cart.map({(Double($0.product.Price) ?? 0) * Double($0.productCount)}).reduce(0, +))
    }

    func checkOut() {
        presentCheckout = true
    }
}
