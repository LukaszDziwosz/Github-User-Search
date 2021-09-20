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
    @Published var searchQuery = ""
    @Published var isLoading = false
    @Published var showFavourite : Bool = false
    @Published var errorMessage = ""
    @Published var isShowingDetailView = false
    private var cancellables: AnyCancellable?
    private var disposables: Set<AnyCancellable> = []
    
    var selectedUser: User? {
        didSet{ isShowingDetailView = true }
    }
    
    init() {
       delayAndPass()
    }
        
}

extension SearchListViewModel {
    
    private func delayAndPass() {
             $searchQuery
                 .removeDuplicates()
                 .debounce(for: .milliseconds(750), scheduler: RunLoop.main)
                 .sink { [weak self] (searchQuery) in
                     if searchQuery != "" {
                         self?.getUsers(querry: searchQuery)}
                 }
                 .store(in: &disposables)
         }
    
    
    
    private func getUsers(querry: String) {
        cancellables = APIData.usersRequest(.searchUsers, username: querry)
            .mapError({ (error) -> Error in
                self.errorMessage = error.localizedDescription
                          return error
                      })
                      .sink(receiveCompletion: { _ in },
                            receiveValue: {
                          self.users = $0.items
                          self.isLoading = false
                          print("\(String(describing: $0.totalCount))")
                      })
       }
 
}
