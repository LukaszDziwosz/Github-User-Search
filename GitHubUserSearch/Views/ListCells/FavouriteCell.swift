//
//  FavouriteCell.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 21/09/2021.
//

import SwiftUI

struct FavouriteCell: View {
    
    let savedUser: SavedUser
    
    var body: some View {
        HStack{
            
            AsyncImage(
                url: URL(string: savedUser.avatarURL ?? "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png")!,
               placeholder: { Text("Loading ...") },
               image: { Image(uiImage: $0)
                   .resizable()})
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .padding(.trailing)
            
            VStack(alignment: .leading, spacing: 10){
                Text(savedUser.login ?? "")
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(savedUser.htmlURL ?? "")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .lineLimit(nil)
                    .textSelection(.enabled)
            }
           
            Link(destination: URL(string: savedUser.htmlURL!)!) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.primary)
            }
            .frame(width: 20, height: 20)
            .padding(.leading)
        }
    }
    
}

//struct FavouriteCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouriteCell(savedUser: MockData.sampleUser as! SavedUser)
//    }
//}
