//
//  CheckoutViewModel.swift
//  UrbaneTrenz
//

import Foundation
import Alamofire
import SwiftDate

class CheckoutViewModel : ObservableObject {
    
    @Published var shippingMethod : ShippingMethod
    @Published var paymentMethod : PaymentMethod
    private var cartViewModel : CartViewModel
    public var cart : [CartItem]
    
    public enum ShippingMethod {
        case standard
        case expedited
        case express
    }
    
    public enum PaymentMethod {
        case mastercard
        case visacard
    }
    
    init(cart : [CartItem], cartViewModel : CartViewModel) {
        shippingMethod = ShippingMethod.standard
        paymentMethod = PaymentMethod.mastercard
        self.cart = cart
        self.cartViewModel = cartViewModel
    }
    
    func deliveryTime(time:Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        return formatter.string(from: (Date() + time.days))
    }
    
    func calculateTotal() -> String {
        return String(format: "%.2f", cart.map({(Double($0.product.Price) ?? 0) * Double($0.productCount)}).reduce(0, +))
    }
    
    func updateCart() {
        self.cartViewModel.getCart()
    }
    
    func saveOrder() {
        OrderDAO.createOrderFile()
        OrderDAO.addOrder(orderItem: OrderItem(cart: cart, totalPrice: self.calculateTotal()))
        CartDAO.deleteAll()
    }
}
