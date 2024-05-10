//
//  SubcategoryViewModel.swift
//  UrbaneTrenz
//

import Foundation
import Alamofire
import SwiftyJSON

class SubCategoryViewModel : ObservableObject {
    
    @Published var subcategories : [String] = [];
    
    public let categoryType : String;
    public let category : String;
    
    init(categoryType: String, category: String){
        self.categoryType = categoryType;
        self.category = category;
        Task {
            await initializeSubcategories()
        }
    }
    
    func initializeSubcategories() async {
        self.subcategories = []
        let urlString = "http://backendserver.us-east-1.elasticbeanstalk.com/api/subcategory?type=\(categoryType)&value=\(category)"
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded){
            AF.request(url)
                .responseDecodable(of: [Subcategory].self) { response in
                    if let result = response.value {
                        for sub in result{
                            self.subcategories.append(sub.SubCategory)
                        }
                    }
                }
        }
    }
}
