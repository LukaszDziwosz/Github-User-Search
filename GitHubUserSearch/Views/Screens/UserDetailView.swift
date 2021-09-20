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
            HStack {
                Spacer()
                
                Button{
                    isShowingDetailView.toggle()
                }label: {
                    XButton(frameXY: 44)
            }
            }
          
            Spacer()
            UserListCell(user: user)
            ScrollView {
                Text(user.reposURL)
                    .font(.body)
                .padding()
            }
            Spacer()
            Link(destination: URL(string: user.htmlURL)!, label: {
                UserButton(title: "Learn More")
            })
 
        }

    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: MockData.sampleUser, isShowingDetailView: .constant(false))
    }
}
