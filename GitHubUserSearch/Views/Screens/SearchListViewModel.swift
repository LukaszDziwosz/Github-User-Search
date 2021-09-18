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
    @Published var isFavourite : Bool = false
    
    private var cancellables: AnyCancellable?
    private var disposables: Set<AnyCancellable> = []
    
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
                print(error.localizedDescription)
                          return error
                      })
                      .sink(receiveCompletion: { _ in },
                            receiveValue: {
                          print($0)
                          self.users = $0.items
                      })
       }
 
}