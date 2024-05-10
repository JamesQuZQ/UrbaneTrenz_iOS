//
//  ShopView.swift
//  UrbaneTrenz
//

import SwiftUI

struct ShopView: View {
    
    @ObservedObject var viewModel : ShopViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(
                    destination:
                        SearchView(viewModel: SearchViewModel()),
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
                .padding(.top, 10)
                
                ForEach(viewModel.categories, id:\.self) { category in
                    NavigationLink(
                        destination:
                            SubcategoryView(viewModel: SubCategoryViewModel(categoryType: viewModel.getCategoryType(category:category), category: category)),
                        label: {
                            VStack(spacing: 0){
                                HStack{
                                    Text(" \(category)   ")
                                        .font(Font.custom("AnotherDangerDemo", size: 30))
                                        .padding(.leading, 10)
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
        ShopView(viewModel:ShopViewModel())
    }
}
