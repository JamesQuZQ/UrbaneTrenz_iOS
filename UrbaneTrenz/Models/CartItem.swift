//
//  CartItem.swift
//  UrbaneTrenz
//

import Foundation

struct CartItem : Codable, Identifiable {
    var id : Int { self.product.ProductID }
    let product: Product
    let productCount: Int
}
