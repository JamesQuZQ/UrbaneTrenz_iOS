//
//  ProductView.swift
//  UrbaneTrenz
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: URL(string: "https://assets.myntassets.com/v1/images/style/properties/87321ab7962a30b2e9b01fa16997029c_images.jpg")) { image in
                    image
                        .resizable()
                        .frame(width:150,height: 150)
                } placeholder: {
                    Color.gray.opacity(0.1)
                }
                VStack(spacing: 0){
                    HStack{
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry" + "\n")
                            .font(.system(size:18))
                            .lineLimit(3)
                        Spacer()
                    }
                    .padding(.bottom, 3)
                    HStack{
                        Text("Women|red|sport")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                        Spacer()
                    }.padding(.bottom, 5)
                    HStack{
                        Text("$50")
                            .foregroundColor(Color(red:0.051,green:0.255,blue:0.820))
                            .font(.system(size:24))
                        Spacer()
                        Text("In Stock")
                    }
                }
                .padding(.trailing, 30)
            }
            .padding(.bottom, -10)
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
            .padding(.horizontal, 30)
            .padding(.bottom, 20)

        }
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
        ProductView()
    }
}
