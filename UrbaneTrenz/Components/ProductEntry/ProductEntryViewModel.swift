//
//  ProductViewModel.swift
//  UrbaneTrenz
//

import Foundation

class ProductEntryViewModel : ObservableObject {
    
    @Published var product : Product
    
    init(product : Product) {
        self.product = product
    }
}
