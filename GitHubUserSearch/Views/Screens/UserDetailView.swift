//
//  UserDetailView.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 20/09/2021.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    @Binding var isShowingDetailView: Bool
   
    
    var body: some View {
        VStack{
            XDismissButton(isShowingDetailView: $isShowingDetailView)
            Spacer()
            UserListCell(user: user)
            ScrollView {
                Text(user.login)
                    .font(.body)
                .padding()
            }
            Spacer()
            Button{
//                isShowingSafariView = true
              } label: {
                UserButton(title: "Learn More")
            }
        }

    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: MockData.sampleUser, isShowingDetailView: .constant(false))
    }
}
