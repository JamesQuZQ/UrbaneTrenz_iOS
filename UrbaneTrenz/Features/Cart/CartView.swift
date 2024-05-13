//
//  CartView.swift
//  UrbaneTrenz
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var viewModel : CartViewModel
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray.opacity(0.1).ignoresSafeArea()
                VStack(spacing: 0){
                    HStack{
                        Spacer()
                        Text(" Cart ")
                            .font(Font.custom("AnotherDangerDemo", size: 40))
                        Spacer()
                    }
                    .background(.black)
                    .foregroundColor(.white)
                    if viewModel.cart.isEmpty {
                        Text("Add your first item to the cart!").padding()
                        
                        Image("empty_box")
                            .offset(y:120)
                     
                    }
                    ScrollView{
                        ForEach(viewModel.cart) { cartItem in
                            CartItemView(viewModel: CartItemViewModel(cartItem: cartItem, cartViewModel: viewModel))
                                .padding(10).padding(.bottom, -20)
                        }
                    }
                    .clipped()
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                    HStack{
                        Spacer()
                        Text(" Subtotal: \(viewModel.calculateTotal())")
                            .padding(.trailing, 5)
                            .padding(.vertical)
                        Button {
                            viewModel.checkOut()
                        } label: {
                            Text("Checkout")
                                .font(.system(size: 20))
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .foregroundColor(.white)
                        .background(.black)
                        .clipShape(Capsule())
                        .buttonStyle(.plain)
                        .disabled(viewModel.cart.isEmpty)
                        .sheet(isPresented: $viewModel.presentCheckout){
                            CheckoutView(viewModel: CheckoutViewModel(cart: viewModel.cart, cartViewModel: viewModel))
                        }
                    }
                    .padding(.top, 5)
                    .padding(.horizontal)
                    .background(.white)
                }
                
            }
        }
        .onAppear{
            viewModel.getCart()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}
