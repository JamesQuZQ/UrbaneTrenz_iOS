//
//  CheckoutView.swift
//  UrbaneTrenz
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var viewModel : CheckoutViewModel
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.1).ignoresSafeArea()
            Button{
                dismiss()
            } label: {
                Text("< Back")
            }
            .zIndex(999)
            .position(x:50, y:10)
            .foregroundColor(.white)
            VStack(spacing: 0){
                HStack{
                    Spacer()
                    Text(" Checkout ")
                        .font(Font.custom("AnotherDangerDemo", size: 40))
                    Spacer()
                }
                .background(.black)
                .foregroundColor(.white)
                ScrollView{
                    VStack(spacing: 5){
                        HStack(alignment:.center){
                            Image(systemName: "1.circle").font(.system(size: 26))
                            Text("Shipping Address").font(.system(size: 20))
                            Spacer()
                        }
                        Divider()
                            .foregroundColor(.gray)
                            .frame(height: 1)
                        VStack{
                            Button{
                                
                            } label: {
                                VStack(spacing: 5){
                                    Image(systemName: "plus.square.dashed")
                                    Text("Click to add a new Address")
                                }
                            }
                            .padding()
                            .foregroundColor(.black)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.top, 10)
                    
                    VStack(spacing: 5){
                        HStack(alignment:.center){
                            Image(systemName: "2.circle").font(.system(size: 26))
                            Text("Shipping Method").font(.system(size: 20))
                            Spacer()
                        }
                        Divider()
                            .foregroundColor(.gray)
                            .frame(height: 1)
                        HStack{
                            VStack() {
                                RadioButton(tag: CheckoutViewModel.ShippingMethod.standard, selection:$viewModel.shippingMethod, label: "Standard: FREE\nDelivery: by May 20th")
                                RadioButton(tag: CheckoutViewModel.ShippingMethod.expedited, selection:$viewModel.shippingMethod, label: "Expedited: $7.99\nDelivery: by May 17th").disabled(true)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    VStack(spacing: 5){
                        HStack(alignment:.center){
                            Image(systemName: "3.circle").font(.system(size: 26))
                            Text("Payment Method").font(.system(size: 20))
                            Spacer()
                        }
                        Divider()
                            .foregroundColor(.gray)
                            .frame(height: 1)
                        HStack{
                            VStack(alignment: .leading) {
                                RadioButton(tag: CheckoutViewModel.PaymentMethod.mastercard, selection:$viewModel.paymentMethod, label: "Standard Debit Mastercard ending in 1234", image: "mastercard")
                                RadioButton(tag: CheckoutViewModel.PaymentMethod.visacard, selection:$viewModel.paymentMethod, label: "Standard Debit Visa Card ending in 4321", image: "visacard")
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    VStack(spacing: 5){
                        HStack(alignment:.center){
                            Image(systemName: "4.circle").font(.system(size: 26))
                            Text("Order Details").font(.system(size: 20))
                            Spacer()
                        }
                        Divider()
                            .foregroundColor(.gray)
                            .frame(height: 1)
                        VStack{
                            ForEach(viewModel.cart) { cartItem in
                                CheckoutItemView(viewModel: CheckoutItemViewModel(cartItem: cartItem))
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .clipped()
                .padding(.horizontal)
                Divider()
                    .frame(height: 1)
                    .background(.gray)
                HStack{
                    HStack(spacing:0){
                        Text("Order Total: ").font(.system(size: 22))
                        Text(viewModel.calculateTotal()).font(.system(size: 22))
                            .foregroundColor(Util.BLUE)
                    }
                    Spacer()
                    Text("")
                        .padding(.vertical)
                    Button {
                    } label: {
                        Text("Place Order")
                            .font(.system(size: 20))
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .foregroundColor(.white)
                    .background(.black)
                    .clipShape(Capsule())
                    
                }
                .padding(.top, 5)
                .padding(.horizontal)
                .background(.white)
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(viewModel: CheckoutViewModel(cart: []))
    }
}
