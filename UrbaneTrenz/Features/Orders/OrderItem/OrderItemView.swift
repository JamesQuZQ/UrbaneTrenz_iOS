//
//  OrderItemView.swift
//  UrbaneTrenz
//

import SwiftUI

struct OrderItemView: View {
    @ObservedObject var viewModel : OrderItemViewModel
    
    var body: some View {
        VStack(spacing:5){
            HStack{
                Text("Order Number:")
                    .foregroundColor(.black)
                    .font(.system(size:20)).bold()
                Spacer()
            }
            HStack{
                Text("\(viewModel.orderItem.orderID.uuidString.replacingOccurrences(of: "-", with: "\u{2011}"))")
                    .foregroundColor(.gray)
                    .font(.system(size:14))
                Spacer()
            }
            Divider()
            HStack{
                AsyncImage(url: URL(string:viewModel.orderItem.cart[0].product.ImageURL)) { image in
                    image
                        .resizable()
                        .frame(width:150,height: 150)
                } placeholder: {
                    Color.gray.opacity(0.1)
                }
                VStack(spacing: 0){
                    HStack{
                        Text(viewModel.orderItem.cart[0].product.ProductTitle + "\n")
                            .font(.system(size:18))
                            .lineLimit(3)
                        Spacer()
                    }
                    .padding(.bottom, 3)
                    HStack{
                        Text(viewModel.orderItem.cart.count > 1 ?
                             "and \(viewModel.orderItem.cart.count-1) more..."
                             : "")
                            .foregroundColor(.gray)
                            .font(.system(size:15))
                            .lineLimit(2)
                        Spacer()
                    }.padding(.bottom, 5)
                    HStack{
                        Text("Total:")
                        Text("$\(viewModel.orderItem.totalPrice)")
                            .foregroundColor(Util.BLUE)
                            .font(.system(size:22))
                        Spacer()
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

struct OrderItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemView(viewModel: OrderItemViewModel(orderItem: OrderItem(cart: [CartItem(product: Product(ProductID: 0, Gender: "Men", Category: "Footwear", SubCategory: "Shoes", ProductType: "Shoe", Colour: "White", ProductUsage: "Sport", ProductTitle: "Sample Shoe", ImageLocal: "", ImageURL: "http://assets.myntassets.com/v1/images/style/properties/7c80fca789c5c1863a4080d7ed57acf0_images.jpg", StockCount: 1, Price: "10"), productCount: 3), CartItem(product: Product(ProductID: 0, Gender: "Men", Category: "Footwear", SubCategory: "Shoes", ProductType: "Shoe", Colour: "White", ProductUsage: "Sport", ProductTitle: "Sample Shoe", ImageLocal: "", ImageURL: "http://assets.myntassets.com/v1/images/style/properties/7c80fca789c5c1863a4080d7ed57acf0_images.jpg", StockCount: 1, Price: "10"), productCount: 3)], totalPrice: "123.00")))
    }
}
