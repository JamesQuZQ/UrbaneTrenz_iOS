//
//  OrderItemViewModel.swift
//  UrbaneTrenz
//

import Foundation

class OrderItemViewModel : ObservableObject {
    
    @Published var orderItem : OrderItem

    init(orderItem : OrderItem) {
        self.orderItem = orderItem
    }
}
