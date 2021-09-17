//
//  ContentView.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 17/09/2021.
//

import SwiftUI

struct SearchListView: View {
    
    @State private var searchText = ""
    @State var isFavourite : Bool = false
    
    var body: some View {
        NavigationView{
            List (MockData.sampleUsers){ user in
                UserListCell(user: user)
                
            }
            .navigationTitle("Git Hub User Search")
            .toolbar { Button(action: {
                self.isFavourite.toggle()
            }) {
                Image(systemName: self.isFavourite == true ? "star.fill" : "star")
                    .foregroundColor(.primary)
                    
            }}
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .searchable(text: $searchText, prompt: "Search Users")
        .autocapitalization(.none)
        .disableAutocorrection(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
