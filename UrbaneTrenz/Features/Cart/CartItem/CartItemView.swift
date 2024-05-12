//
//  CartItemView.swift
//  UrbaneTrenz
//

import SwiftUI

struct CartItemView: View {
    @ObservedObject var viewModel : CartItemViewModel
    
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: URL(string:viewModel.cartItem.product.ImageURL)) { image in
                    image
                        .resizable()
                        .frame(width:150,height: 150)
                } placeholder: {
                    Color.gray.opacity(0.1)
                }
                VStack(spacing: 0){
                    HStack{
                        Text(viewModel.cartItem.product.ProductTitle + "\n")
                            .font(.system(size:18))
                            .lineLimit(3)
                        Spacer()
                    }
                    .padding(.bottom, 3)
                    HStack{
                        Text("\(viewModel.cartItem.product.Gender) | \(viewModel.cartItem.product.SubCategory) | \(viewModel.cartItem.product.Colour) | \(viewModel.cartItem.product.ProductUsage)")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                            .lineLimit(2)
                        Spacer()
                    }.padding(.bottom, 5)
                    HStack{
                        Text("$\(viewModel.cartItem.product.Price)")
                            .foregroundColor(Util.BLUE)
                            .font(.system(size:22))
                        Spacer()
                        viewModel.cartItem.product.StockCount > 0 ?
                        Text("In Stock")
                            .foregroundColor(.green)
                            .font(.system(size:14)) :
                        Text("Out of Stock")
                            .foregroundColor(.red)
                            .font(.system(size:14))
                    }
                }
            }
            .padding(.bottom, -20)
            HStack{
                Spacer()
                Button{
                    viewModel.removeItem()
                } label: {
                    Text("Remove")
                        .padding(.trailing, -3)
                        .font(.system(size: 14))
                    Image(systemName: "trash")
                        .font(.system(size: 14))
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .foregroundColor(.black)
                
                HStack{
                    Button{
                        viewModel.decreaseItemCount()
                    } label: {
                        Image(systemName: "minus")
                    }
                    .foregroundColor(.gray)
                    Text(String(viewModel.cartItem.productCount))
                    Button{
                        viewModel.increaseItemCount()
                    } label: {
                        Image(systemName: "plus")
                        
                    }
                    .foregroundColor(.gray)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .overlay(
                    Capsule()
                        .stroke(.gray, lineWidth: 1)
                )
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

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(viewModel: CartItemViewModel(cartItem: CartItem(product: Product(ProductID: 0, Gender: "Men", Category: "Footwear", SubCategory: "Shoes", ProductType: "Shoe", Colour: "White", ProductUsage: "Sport", ProductTitle: "Sample Shoe", ImageLocal: "", ImageURL: "http://assets.myntassets.com/v1/images/style/properties/7c80fca789c5c1863a4080d7ed57acf0_images.jpg", StockCount: 1, Price: "10"), productCount: 3), cartViewModel: CartViewModel()))
    }
}
