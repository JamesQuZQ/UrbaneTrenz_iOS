//
//  Product.swift
//  UrbaneTrenz
//

import Foundation

struct Product : Codable, Identifiable {
    var id : Int { self.ProductID }
    let ProductID : Int
    let Gender : String
    let Category : String
    let SubCategory : String
    let ProductType : String
    let Colour : String
    let ProductUsage : String
    let ProductTitle : String
    let ImageLocal : String
    let ImageURL : String
    let StockCount : Int
    let Price : String
}
