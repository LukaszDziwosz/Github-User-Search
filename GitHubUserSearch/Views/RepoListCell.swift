//
//  RepoListCell.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 21/09/2021.
//

import SwiftUI

struct RepoListCell: View {
    
    let repo: Repos
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(repo.name)
                
                Text(repo.language ?? "")
                    .font(.caption)
            }.padding(.leading)
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text("⭐️\(repo.stars)")
                
                Text("👀\(repo.watchers)")
            }.padding(.trailing)
        }
    }
}

struct RepoListCell_Previews: PreviewProvider {
    static var previews: some View {
        RepoListCell(repo: MockData.sampleRepo)
    }
}
