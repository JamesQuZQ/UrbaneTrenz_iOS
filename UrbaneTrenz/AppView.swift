//
//  AppView.swift
//  UrbaneTrenz
//

import SwiftUI

struct AppView: View {
    @State private var selected = 0
    
    init() {
       for family in UIFont.familyNames {
           print("Family: \(family)")
           for name in UIFont.fontNames(forFamilyName: family) {
               print("   - \(name)")
           }
       }
    }

    
    var body: some View {
        TabView(selection:$selected){
            HomeView().tabItem{
                Label("Home", systemImage: "house")
            }.tag(1)
            ShopView().tabItem{
                Label("Shop", systemImage: "doc.text.magnifyingglass")
            }.tag(2)
            HomeView().tabItem{
                Label("List", systemImage: "heart")
            }.tag(3)
            HomeView().tabItem{
                Label("Cart", systemImage: "cart")
            }.tag(4)
            HomeView().tabItem{
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
