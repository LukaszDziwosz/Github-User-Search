//
//  ContentView.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 17/09/2021.
//

import SwiftUI

struct SearchListView: View {
    
    @ObservedObject var viewModel = SearchListViewModel()
    
    var body: some View {
        NavigationView{
            List (viewModel.users, id: \.id) { user in
                UserListCell(user: user)
                
            }
            .navigationTitle("Git Hub User Search")
            .toolbar { Button(action: {
                viewModel.isFavourite.toggle()
            }) {
                Image(systemName: viewModel.isFavourite == true ? "star.fill" : "star")
                    .foregroundColor(.primary)
                    
            }}
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .searchable(text: $viewModel.searchQuery, prompt: "Search Users")
        .autocapitalization(.none)
        .disableAutocorrection(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
