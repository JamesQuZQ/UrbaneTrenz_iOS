//
//  OrderItem.swift
//  UrbaneTrenz
//

import Foundation

struct OrderItem : Codable, Identifiable {
    var id : UUID { self.orderID }
    let orderID : UUID = UUID()
    let cartItem: [CartItem]
    let totalPrice: String
}
