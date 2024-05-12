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
            WishListView().tabItem{
                Label("List", systemImage: "heart")
            }.tag(3)
            CartView(viewModel: CartViewModel()).tabItem{
                Label("Cart", systemImage: "cart")
            }.tag(4)
            OrdersView().tabItem{
                Label("Orders", systemImage: "shippingbox")
            }.tag(5)
        }.accentColor(.black)

    }
}



struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
