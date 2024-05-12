//
//  CheckoutItemView.swift
//  UrbaneTrenz
//


import SwiftUI

struct CheckoutItemView: View {
    
    @ObservedObject var viewModel : CheckoutItemViewModel
    
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: URL(string:viewModel.cartItem.product.ImageURL)) { image in
                    image
                        .resizable()
                        .frame(width:120,height: 120)
                } placeholder: {
                    Color.gray.opacity(0.1)
                }
                VStack(spacing: 0){
                    HStack{
                        Text(viewModel.cartItem.product.ProductTitle + "\n")
                            .font(.system(size:15))
                            .lineLimit(3)
                        Spacer()
                    }
                    .padding(.bottom, 3)
                    HStack{
                        Text("\(viewModel.cartItem.product.Gender) | \(viewModel.cartItem.product.SubCategory) | \(viewModel.cartItem.product.Colour) | \(viewModel.cartItem.product.ProductUsage)")
                            .foregroundColor(.gray)
                            .font(.system(size:12))
                            .lineLimit(2)
                        Spacer()
                    }.padding(.bottom, 5)
                    HStack{
                        Text("$\(viewModel.cartItem.product.Price)")
                            .foregroundColor(Util.BLUE)
                            .font(.system(size:20))
                        Spacer()
                        Text("x" + String(viewModel.cartItem.productCount))
                            .padding(5)
                            .border(.gray, width: 1)
                            .padding(.trailing, 8)
                    }
                }
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

struct CheckoutItemView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutItemView(viewModel: CheckoutItemViewModel(cartItem: CartItem(product: Product(ProductID: 0, Gender: "Men", Category: "Footwear", SubCategory: "Shoes", ProductType: "Shoe", Colour: "White", ProductUsage: "Sport", ProductTitle: "Sample Shoe", ImageLocal: "", ImageURL: "http://assets.myntassets.com/v1/images/style/properties/7c80fca789c5c1863a4080d7ed57acf0_images.jpg", StockCount: 1, Price: "10"), productCount: 3)))
    }
}
