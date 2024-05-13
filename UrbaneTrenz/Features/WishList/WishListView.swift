//
//  WishListView.swift
//  UrbaneTrenz
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray.opacity(0.1).ignoresSafeArea()
                VStack(spacing: 0){
                    HStack{
                        Spacer()
                        Text(" List ")
                            .font(Font.custom("AnotherDangerDemo", size: 40))
                        Spacer()
                    }
                    .background(.black)
                    .foregroundColor(.white)
                    
                    ScrollView{
                        
                    }
                    .clipped()
                }
                
                VStack{
                    Spacer()
                }
            }
        }
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
    }
}
