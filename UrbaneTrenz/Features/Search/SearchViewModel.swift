//
//  SearchViewModel.swift
//  UrbaneTrenz
//

import Foundation

class SearchViewModel : ObservableObject {
    
    @Published var query : String = ""
    
    init() {
        // Update recently viewed
    }
}
