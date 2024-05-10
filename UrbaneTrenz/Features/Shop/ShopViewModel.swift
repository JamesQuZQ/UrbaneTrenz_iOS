//
//  ShopViewModel.swift
//  UrbaneTrenz
//

import Foundation

class ShopViewModel : ObservableObject {
    
    var categories = ["women", "men", "girls", "boys", "apparel", "footwear"]
    
    init(){
        
    }
    
    func getCategoryType(category : String) -> String {
        return (category == "apparel" || category == "footwear") ?  "category" : "gender"
    }
}
