//
//  CheckoutViewModel.swift
//  UrbaneTrenz
//

import Foundation

class CheckoutViewModel : ObservableObject {
    
    @Published var shippingMethod : ShippingMethod
    @Published var paymentMethod : PaymentMethod
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
    
    init(cart : [CartItem]) {
        shippingMethod = ShippingMethod.standard
        paymentMethod = PaymentMethod.mastercard
        self.cart = cart
    }
    
    func calculateTotal() -> String {
        return String(format: "%.2f", cart.map({(Double($0.product.Price) ?? 0) * Double($0.productCount)}).reduce(0, +))
    }
}
