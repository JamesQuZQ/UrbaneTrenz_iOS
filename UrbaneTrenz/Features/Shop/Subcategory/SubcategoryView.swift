//
//  CategoryView.swift
//  UrbaneTrenz
//

import SwiftUI

struct SubcategoryView: View {
    @ObservedObject var viewModel : SubCategoryViewModel
        
    var body: some View {
        ScrollView{
            VStack{
                ForEach(viewModel.subcategories, id:\.self) { subcategory in
                    NavigationLink(
                        destination:
                            ProductDisplayView(viewModel: ProductDisplayViewModel(categoryType: viewModel.categoryType, category: viewModel.category, subcategory: subcategory)),
                        label: {
                            VStack(spacing: 0){
                                HStack{
                                    Text(" \(subcategory)   ")
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

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SubcategoryView(viewModel: SubCategoryViewModel(categoryType: "Gender", category: "male"))
    }
}
