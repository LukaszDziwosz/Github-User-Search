//
//  UserListCell.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 17/09/2021.
//

import SwiftUI

struct UserListCell: View {
    
    let user: User
    
    var body: some View {
        HStack{
            
            AsyncImage(
                url: URL(string: user.avatarURL ?? "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png")!,
               placeholder: { Text("Loading ...") },
               image: { Image(uiImage: $0)
                   .resizable()})
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .padding(.trailing)
            
            VStack(alignment: .leading, spacing: 10){
                Text(user.login)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(user.htmlURL)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .lineLimit(nil)
                    .textSelection(.enabled)
            }
            
        }
    }
}

struct UserListCell_Previews: PreviewProvider {
    static var previews: some View {
        UserListCell(user: MockData.sampleUser)
    }
}
