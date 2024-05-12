//
//  ProductDisplayView.swift
//  UrbaneTrenz
//

import SwiftUI

struct ProductDisplayView: View {
    
    @ObservedObject var viewModel : ProductDisplayViewModel
    
    var body: some View {
        VStack(spacing: 0){
            HStack{
                Spacer()
                viewModel.query == "" ?
                Text(" \(viewModel.subcategory) for \(viewModel.categoryType=="gender" ? viewModel.category : "all") ")
                    .font(Font.custom("AnotherDangerDemo", size: 30)) :
                Text(" Result for \(viewModel.query)").font(Font.custom("AnotherDangerDemo", size: 30))
                Spacer()
            }
//                    .background(.black)
//                    .foregroundColor(.white)
            Divider()
                .frame(height:8)
                .background(Util.BLUE)
            
            ScrollView{
                VStack(spacing: 0) {
                    ForEach(viewModel.products){ product in
                        ProductEntryView(viewModel: ProductEntryViewModel(product: product)).padding(10).padding(.bottom, -10)
                    }
                }
            }.clipped()
        }
    }
}

struct ProductDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDisplayView(viewModel: ProductDisplayViewModel(categoryType: "gender", category: "male", subcategory: "Sandal"))
    }
}
