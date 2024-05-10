//
//  SearchView.swift
//  UrbaneTrenz
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var viewModel : SearchViewModel
    @FocusState var focused : Bool?
    @State var selection: String? = nil
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                NavigationLink(
                    destination: ProductDisplayView(viewModel: ProductDisplayViewModel(query:viewModel.query)),
                    tag: "A",
                    selection: $selection
                ){}
                TextField("Search...", text: $viewModel.query)
                    .padding(.leading, 20)
                    .font(.system(size: 20))
                    .focused($focused, equals: true)
                    .onSubmit {
                        selection = "A"
                    }
                    .onAppear { DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { self.focused = true }
                    }
                Spacer()
                Button(){
                    viewModel.query = ""
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                }.padding(.trailing, 20)
            }
            .padding(.top, 20)
            .padding(.bottom, 10)
            Divider()
                .frame(height:2)
            Spacer()
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
