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
        NavigationView {
            VStack {
             mainView()
           
            }
            .navigationTitle("Git Hub User Search")
            .toolbar { Button(action: {
                viewModel.showFavourite.toggle()
            }) {
                Image(systemName: viewModel.showFavourite == true ? "star.fill" : "star")
                    .foregroundColor(.primary)
            }}
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                UserDetailView(user: viewModel.selectedUser ?? MockData.sampleUser, isShowingDetailView: $viewModel.isShowingDetailView)
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .searchable(text: $viewModel.searchQuery, prompt: "Search Users")
        .autocapitalization(.none)
        .disableAutocorrection(true)
        
    }
  
    //MARK: subviews
    
    func listView() -> some View {
        List (viewModel.users, id: \.id) { user in
            UserListCell(user: user)
                .onTapGesture {
                    viewModel.selectedUser = user
        }
       
        }
    }
    
    func mainView() -> some View {
        Group {
            if viewModel.isLoading {
                LoadingView()
            }else if viewModel.errorMessage != "" {
                ErrorView(message: viewModel.errorMessage)
            }else if viewModel.users.count > 0 {
                listView()
            }else if viewModel.searchQuery == "" {
                ErrorView(message: "Try searching for Github users, using search bar. 🔎")
            }else {
                LoadingView()
            }
       
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
