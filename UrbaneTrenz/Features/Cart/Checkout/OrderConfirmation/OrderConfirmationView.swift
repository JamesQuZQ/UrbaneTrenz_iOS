//
//  OrderConfirmationView.swift
//  UrbaneTrenz
//

import SwiftUI

struct OrderConfirmationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack{
                Text("Your order has been successfully placed!")
                    .font(.system(size:30))
                    .foregroundColor(.black)
                    .padding(.bottom, 40)
                Button{
                    dismiss()
                } label: {
                    VStack {
                        Image(systemName: "hands.clap")
                            .font(.system(size:50))
                        Text("Great!").font(.system(size:26))
                    }
                    .foregroundColor(Util.BLUE)
                }
            }
        }
    }
}

struct OrderConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmationView()
    }
}
