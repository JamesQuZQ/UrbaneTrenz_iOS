//
//  OrdersViewModel.swift
//  UrbaneTrenz
//

import Foundation

class OrdersViewModel : ObservableObject {
    
    @Published var orders : [OrderItem] = []
    
    init() {
        OrderDAO.createOrderFile()
        getOrders()
    }
    
    func getOrders() {
        orders = OrderDAO.readFromOrder()
    }
}
