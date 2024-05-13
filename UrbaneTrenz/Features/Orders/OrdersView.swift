//
//  OrdersView.swift
//  UrbaneTrenz
//

import SwiftUI


struct OrdersView: View {
    @ObservedObject var viewModel: OrdersViewModel
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray.opacity(0.1).ignoresSafeArea()
                VStack(spacing: 0){
                    HStack{
                        Spacer()
                        Text(" Orders ")
                            .font(Font.custom("AnotherDangerDemo", size: 40))
                        Spacer()
                    }
                    .background(.black)
                    .foregroundColor(.white)
                    if viewModel.orders.isEmpty {
                        Text("Make your first Order!").padding()
                        Image("empty_box")
                            .offset(y:120)
                    }
                    ScrollView{
                        ForEach(viewModel.orders) { orderItem in
                            OrderItemView(viewModel: OrderItemViewModel(orderItem: orderItem))
                                .padding(10).padding(.bottom, -20)
                        }
                    }
                    .clipped()
                }
                
            }
        }
        .onAppear{
            viewModel.getOrders()
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView(viewModel: OrdersViewModel())
    }
}
