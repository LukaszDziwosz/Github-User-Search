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
    @Published var repos: [Repos] = []
    @Published var searchQuery = ""
    @Published var isLoading = false
    @Published var showFavourite : Bool = false
    @Published var errorMessage = ""
    @Published var isShowingDetailView = false
    @Published var totalCount = 0
    @Published var currentpage = 1
    @Published var isMorePossible = true
    
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
                         self?.users.removeAll()
                         self?.isLoading = true
                         self?.currentpage = 1
                         self?.isMorePossible = true
                         self?.getUsers(querry: searchQuery)}
                 }
                 .store(in: &disposables)
         }
    
    
    
     func getUsers(querry: String) {
         cancellables = APIData.usersRequest(.searchUsers, username: querry, page: currentpage)
            .mapError({ (error) -> Error in
                self.isLoading = false
                self.errorMessage = error.localizedDescription
                          return error
                      })
                      .sink(receiveCompletion: { _ in },
                            receiveValue: {
                          self.totalCount = $0.totalCount ?? 0
                          self.users += $0.items
                          self.users.removeDuplicates()
                          self.isMorePossible = self.users.count < self.totalCount && self.users.count < 150
                          self.isLoading = false
                          self.errorMessage = ""
                      })
       }
    
    func getRepos(repoURL: String) {
        cancellables = APIData.repoRequest(urlString: repoURL)
            .mapError({ (error) -> Error in
                self.errorMessage = error.localizedDescription
                          return error
                      })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                self.repos = $0
                
            })
    }
 
}
