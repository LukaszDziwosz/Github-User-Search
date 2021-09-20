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
             textSearchBar()
            
             Spacer()
                
             mainView()
             
             Spacer()
           
            }
            .navigationBarTitle (Text(viewModel.searchQuery.isEmpty ? "💻 GitHub User Search" : "Found \(viewModel.totalCount) results"),
                                 displayMode: .inline)
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                UserDetailView(user: viewModel.selectedUser ?? MockData.sampleUser, isShowingDetailView: $viewModel.isShowingDetailView)
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
      
    }
  
    //MARK: subviews
    
    func textSearchBar() -> some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.primary)
                .opacity(viewModel.searchQuery == "" ? 0.3 : 0.9)
                
            
            TextField("Users Search...", text: $viewModel.searchQuery)
                .ignoresSafeArea(.keyboard, edges: .bottom)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            Button(action: {
                viewModel.searchQuery = ""
                viewModel.isMorePossible = true
                viewModel.currentpage = 1
                viewModel.users.removeAll()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.primary)
                    .opacity(viewModel.searchQuery == "" ? 0 : 0.9)
            }
            
            Button(action: {
                viewModel.showFavourite.toggle()
            }) {
                Image(systemName: viewModel.showFavourite == true ? "star.fill" : "star")
                    .foregroundColor(.primary)
            }
        }
        .frame(height: 20)
        .padding()
        .background(Color(.systemFill))
        .cornerRadius(10)
    }
    
    func listView() -> some View {
        List{
         ForEach(viewModel.users, id: \.id) { user in
            UserListCell(user: user)
                .onTapGesture {
                    viewModel.selectedUser = user }
                }
            if self.viewModel.isMorePossible {
                Text(viewModel.users.count < 120 ? "Fetching more..." : "Please narrow the search")
                .onAppear(perform: {
                    self.viewModel.currentpage += 1
                    self.viewModel.getUsers(querry: viewModel.searchQuery)
                    })
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
