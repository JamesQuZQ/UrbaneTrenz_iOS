//
//  OrdersView.swift
//  UrbaneTrenz
//

import SwiftUI


struct OrdersView: View {
    @ObservedObject var viewModel: OrdersViewModel // Assuming you have an OrdersViewModel
    
    let options = ["NSW", "VIC", "QLD", "SA", "WA", "TAS", "ACT", "NT"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.1).ignoresSafeArea()
                VStack(spacing: 0) {
                    HStack {
                        Spacer()
                        Text(" Order ")
                            .font(Font.custom("AnotherDangerDemo", size: 40))
                        Spacer()
                    }
                    .background(.black)
                    .foregroundColor(.white)
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            TextField("Name", text: $viewModel.name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Street", text: $viewModel.street)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Suburb", text: $viewModel.suburb)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("City", text: $viewModel.city)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            HStack { // Use HStack for state selection
                                                            Text("State")
                                                                .font(.headline)
                                                            Spacer()
                                                            Picker("Select a State", selection: $viewModel.selectedStateIndex) {
                                                                ForEach(0..<options.count) {
                                                                    Text(options[$0])
                                                                }
                                                            }
                                                            .pickerStyle(MenuPickerStyle())
                                                        }
                                                        .padding()
                            
                            TextField("Phone Number", text: $viewModel.phoneNumber)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                            TextField("Email", text: $viewModel.email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.emailAddress)
                            
                            Button("Confirm Order") {
                                // Handle order confirmation
                                if viewModel.isValid {
                                                                    // Handle order confirmation
                                                                    viewModel.name = ""
                                                                    viewModel.phoneNumber = ""
                                                                    viewModel.email = ""
                                                                    viewModel.street = ""
                                                                    viewModel.city = ""
                                                                    viewModel.suburb = ""
                                                                    
                                                                    // Show alert
                                    viewModel.showAlert = true
                                                                }
                                                            }
                            .alert(isPresented: $viewModel.showAlert) {
                                                            Alert(title: Text("Order Placed"), message: Text("Your order has been placed successfully!"), dismissButton: .default(Text("OK")))
                                                        }
                            
                            .padding()
                            .foregroundColor(.white)
                            .background(viewModel.isValid ? Color.yellow : Color.gray)
                            .cornerRadius(8)
                            .disabled(!viewModel.isValid)
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView(viewModel: OrdersViewModel())
    }
}
