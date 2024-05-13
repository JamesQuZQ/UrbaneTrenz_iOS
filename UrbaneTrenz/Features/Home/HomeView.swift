//
//  CartView.swift
//  UrbaneTrenz
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white.ignoresSafeArea()
                VStack(spacing: 0){
                    HStack{
                        Spacer()
                        Text(" Urbane Trenz ")
                            .font(Font.custom("AnotherDangerDemo", size: 40))
                        Spacer()
                    }
                    .background(.black)
                    .foregroundColor(.white)
                    ScrollView{
                        VStack(spacing: 0){
                            HStack{
                                Spacer()
                                Text("Free shipping on all orders")
                                    .padding()
                                    .font(.system(size: 30))
                                    .bold()
                                Spacer()
                            }
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            VStack(spacing: 0) {
                                ProductSection(imageName: "home2", description: "Shop Fall 2024")
                                ProductSection(imageName: "home5", description: "New Arrivals")
                                ProductSection(imageName: "home7", description: "Shop Collection")
                            }
                        }
                       Spacer()
                    }
                    .clipped()
                }
            }
        }
    }
}


struct ProductSection: View {
    var imageName: String
    var description: String
    
    var body: some View {
        VStack(spacing:0) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .overlay(
                    VStack{
                        Spacer()
                        Text(description)
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 30))
                            .padding(.bottom, 5)
                            .shadow(
                                color:Color.black,
                                radius: 10)
                    }
                )
        }
        .padding()
        .padding(.top, -10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

