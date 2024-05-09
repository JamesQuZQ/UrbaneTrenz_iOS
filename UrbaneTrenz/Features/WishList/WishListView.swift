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
                        Text(" Cart ")
                            .font(Font.custom("AnotherDangerDemo", size: 40))
                        Spacer()
                    }
                    .background(.black)
                    .foregroundColor(.white)
                    
                    ScrollView{
                        VStack(spacing: 0) {
                            ProductView().padding(10).padding(.bottom, -10)
                            ProductView().padding(10).padding(.bottom, -10)
                            ProductView().padding(10).padding(.bottom, -10)
                            ProductView().padding(10).padding(.bottom, -10)
                        }
                    }
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
