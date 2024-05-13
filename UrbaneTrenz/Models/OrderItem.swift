//
//  OrderItem.swift
//  UrbaneTrenz
//

import Foundation

struct OrderItem : Codable, Identifiable {
    var id : UUID { self.orderID }
    var orderID : UUID = UUID()
    let cart: [CartItem]
    let totalPrice: String
}
