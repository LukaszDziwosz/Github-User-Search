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
            Image("alamopic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10){
                Text(user.login)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(user.url)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .lineLimit(nil)
                    .textSelection(.enabled)
            }
            .padding(.leading)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.title)
                .padding(.trailing, 10)
        }
    }
}

struct UserListCell_Previews: PreviewProvider {
    static var previews: some View {
        UserListCell(user: MockData.sampleUser)
    }
}
