//
//  CartView.swift
//  UrbaneTrenz
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray.opacity(0.1).ignoresSafeArea()
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
                        Text("Welcome to Urbane Trenz")
                                               .padding()
                                               .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                                                   .cornerRadius(8)
                                                   .foregroundColor(.white)
                                                   .multilineTextAlignment(.center)
                                                   .padding()
                                           
                                           VStack(spacing: 16) { // 间隔设置为 16
                                               ProductSection(imageName: "home2", description: "This is the new product in this Spring. Enjoy your cloth in here.")
                                               ProductSection(imageName: "home5", description: "Another great product for your style. Be a fassion woman in the city")
                                               ProductSection(imageName: "home7", description: "Check out this exclusive summer collection.Enjoy the whole sunny day.")
                                           }
                                           
                                           Spacer()
                    }
                    .clipped()

                    HStack{
                        Spacer()
                        
                    }
                }
                
            }
        }
    }
}


struct ProductSection: View {
    var imageName: String
    var description: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 300, height: 200)
                .scaledToFit()
            
            Text(description)
                .padding()
                .background(Color.gray.opacity(0.04)) // 灰色背景
                .cornerRadius(8) // 圆角半径
                .foregroundColor(.brown) // 文本颜色
                .multilineTextAlignment(.center) // 多行文本居中对齐
                .lineLimit(3) // 最多显示 3 行文本
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

