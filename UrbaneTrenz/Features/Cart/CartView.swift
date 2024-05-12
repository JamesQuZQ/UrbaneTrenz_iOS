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
                    ScrollView{
                        ForEach(viewModel.cart) { cartItem in
                            CartItemView(viewModel: CartItemViewModel(cartItem: cartItem, cartViewModel: viewModel))
                                .padding(10).padding(.bottom, -10)
                        }
                    }
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
