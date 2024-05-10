//
//  ProductView.swift
//  UrbaneTrenz
//

import SwiftUI

struct ProductEntryView: View {
    @ObservedObject var viewModel : ProductEntryViewModel
    
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: URL(string:viewModel.product.ImageURL)) { image in
                    image
                        .resizable()
                        .frame(width:150,height: 150)
                } placeholder: {
                    Color.gray.opacity(0.1)
                }
                VStack(spacing: 0){
                    HStack{
                        Text(viewModel.product.ProductTitle + "\n")
                            .font(.system(size:18))
                            .lineLimit(3)
                        Spacer()
                    }
                    .padding(.bottom, 3)
                    HStack{
                        Text("\(viewModel.product.Gender) | \(viewModel.product.SubCategory) | \(viewModel.product.Colour) | \(viewModel.product.ProductUsage)")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                            .lineLimit(2)
                        Spacer()
                    }.padding(.bottom, 5)
                    HStack{
                        Text("$\(viewModel.product.Price)")
                            .foregroundColor(Util.BLUE)
                            .font(.system(size:22))
                        Spacer()
                        viewModel.product.StockCount > 0 ?
                        Text("In Stock")
                            .foregroundColor(.green)
                            .font(.system(size:14)) :
                        Text("Out of Stock")
                            .foregroundColor(.red)
                            .font(.system(size:14))
                    }
                }
            }
            .padding(.bottom, -5)
            HStack{
                Button{
                    
                } label: {
                    Text("Save to List").padding(.trailing, -3)
                    Image(systemName: "note.text.badge.plus").padding(.top, 2)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .foregroundColor(.black)
                
                Spacer()
                Button{
                    
                } label: {
                    Text("Add to Cart").padding(.trailing, -5)
                    Image(systemName: "cart.badge.plus")
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .foregroundColor(.white)
                .background(.black)
                .clipShape(Capsule())
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 1)
        )
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductEntryView(viewModel: ProductEntryViewModel(product: Product(ProductID: 0, Gender: "Men", Category: "Footwear", SubCategory: "Shoes", ProductType: "Shoe", Colour: "White", ProductUsage: "Sport", ProductTitle: "Sample Shoe", ImageLocal: "", ImageURL: "http://assets.myntassets.com/v1/images/style/properties/7c80fca789c5c1863a4080d7ed57acf0_images.jpg", StockCount: 1, Price: "10")))
    }
}
