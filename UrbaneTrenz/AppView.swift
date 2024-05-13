//
//  AppView.swift
//  UrbaneTrenz
//

import SwiftUI

struct AppView: View {
    @State private var selected = 0
    
    var body: some View {
        TabView(selection:$selected){
            HomeView().tabItem{
                Label("Home", systemImage: "house")
            }.tag(1)
            ShopView(viewModel: ShopViewModel()).tabItem{
                Label("Shop", systemImage: "doc.text.magnifyingglass")
            }.tag(2)
            CartView(viewModel: CartViewModel()).tabItem{
                Label("Cart", systemImage: "cart")
            }.tag(3)
            OrdersView(viewModel: OrdersViewModel()).tabItem{
                Label("Orders", systemImage: "shippingbox")
            }.tag(4)
        }.accentColor(.black)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
