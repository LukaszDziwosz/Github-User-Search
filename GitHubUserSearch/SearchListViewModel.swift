//
//  SearchListViewModel.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 17/09/2021.
//

import Foundation
import Combine

class SearchListViewModel: ObservableObject {
    
    @Published var users: [User] = []
    var cancellables: AnyCancellable?
    
}
