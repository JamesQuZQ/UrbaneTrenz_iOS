//
//  ProductViewModel.swift
//  UrbaneTrenz
//

import Foundation
import SwiftyJSON
import Alamofire

class ProductEntryViewModel : ObservableObject {
    
    @Published var product : Product
    
    init(product : Product) {
        self.product = product
    }
    
    func addToCart(){
        CartDAO.addProductToCart(product:product)
    }
}
