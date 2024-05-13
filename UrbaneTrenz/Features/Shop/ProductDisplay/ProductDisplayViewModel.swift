//
//  ProductDisplayViewModel.swift
//  UrbaneTrenz
//

import Foundation
import Alamofire

class ProductDisplayViewModel : ObservableObject {
    @Published var products : [Product] = []
    
    public let categoryType : String
    public let category : String
    public let subcategory : String
    public let query : String
    
    init(categoryType: String, category: String, subcategory: String){
        self.categoryType = categoryType
        self.category = category
        self.subcategory = subcategory
        self.query = ""
        Task {
            await initializeProductsWithCategory()
        }
    }
    
    init(query: String) {
        self.categoryType = ""
        self.category = ""
        self.subcategory = ""
        self.query = query
        Task {
            await initializeProductsWithQuery()
        }
    }
    
    
    func initializeProductsWithQuery() async {
        self.products = []
        let urlString = "http://backendserver.us-east-1.elasticbeanstalk.com/api/query?queryValue=\(self.query)"
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded){
            AF.request(url)
                .responseDecodable(of: [Product].self) { response in
                    if let result = response.value {
                        if !result.isEmpty {
                            self.products = Array(result[0..<10])
                        }
                    } else {
                        print(response.error ?? "Error sending query")
                    }
            }
        }
    }
    
    
    func initializeProductsWithCategory() async {
        self.products = []
        let urlString = "http://backendserver.us-east-1.elasticbeanstalk.com/api/browse?type=\(categoryType)&value=\(category)&subcategory=\(subcategory)&count=10"
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded){
            AF.request(url)
                .responseDecodable(of: [Product].self) { response in
                    if let result = response.value {
                        self.products = result
                    } else {
                        print(response.error ?? "Error sending query")
                    }
            }
        }
    }
}
