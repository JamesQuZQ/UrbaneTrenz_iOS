//
//  OrdersViewModel.swift
//  UrbaneTrenz
//
//  Created by Mingqian Wang on 13/5/2024.
//

import Foundation

class OrdersViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var phoneNumber = ""
    @Published var email = ""
    @Published var street = ""
    @Published var city = ""
    @Published var suburb = ""
    @Published var state = ""
    @Published var selectedStateIndex = 0
    @Published var selectInbox = 0
    @Published var showAlert = false
    
    var isValid: Bool {
            return validateInputs()
        }
        
        func validateInputs() -> Bool {
            let isPhoneNumberValid = phoneNumber.count == 10 && phoneNumber.allSatisfy { $0.isNumber }
            let isEmailValid = isValidEmail(email)
            let areRequiredFieldsFilled = !name.isEmpty && !street.isEmpty && !suburb.isEmpty && !city.isEmpty && !(selectInbox<0)
            
            return isPhoneNumberValid && isEmailValid && areRequiredFieldsFilled
        }
        
        func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
}

