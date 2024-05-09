//
//  ShopView.swift
//  UrbaneTrenz
//

import SwiftUI

struct ShopView: View {
    var categories = ["men", "women", "girls", "boys"]
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(
                    destination:
                        CategoryView(),
                    label: {
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            Text("Search")
                                .foregroundColor(.gray)
                            Spacer()
                        }.padding(15)
                    })
                .overlay(
                    Capsule()
                        .stroke(.gray, lineWidth: 1)
                )
                .background(Color(hue: 0,saturation: 0,brightness: 0.98))
                .clipShape(Capsule())
                .padding(.horizontal, 20)
                
                ForEach(categories, id:\.self) { category in
                    NavigationLink(
                        destination:
                            CategoryView(),
                        label: {
                            VStack(spacing: 0){
                                HStack{
                                    Text("\(category)")
                                        .font(Font.custom("AnotherDangerDemo", size: 40))
                                        .padding(.leading, 30)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                Divider()
                                    .frame(height:2)
                                    .padding(.horizontal,20)
                            }
                        })
                }
                Spacer()
            }
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
