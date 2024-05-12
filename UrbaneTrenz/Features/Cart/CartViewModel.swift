//
//  CartViewModel.swift
//  UrbaneTrenz

import Foundation
import Alamofire
import SwiftyJSON

class CartViewModel : ObservableObject {
    
    @Published var cart : [CartItem] = []
    
    init() {
        getCart()
    }
    
    func getCart() {
        CartDAO.createCart()
        cart = CartDAO.readFromCart()
    }
}
