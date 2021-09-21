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
    @Binding var repos: [Repos]
    @Environment(\.managedObjectContext) var viewContext

    
    
    func saveContext() {
      do {
        try viewContext.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }
    func addFavourite(id: UUID,login:String, avatarURL: String, htmlURL: String, reposURL: String) {
      
        let newUser = SavedUser(context: viewContext)

      newUser.id = id
      newUser.login = login
      newUser.avatarURL = avatarURL
      newUser.htmlURL = htmlURL
      newUser.reposURL = reposURL

        saveContext()
    }

    
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                self.addFavourite(id: user.id, login: user.login, avatarURL: user.avatarURL ?? "", htmlURL: user.htmlURL, reposURL: user.login)
                }) {
                    Image(systemName: "star")
                        .foregroundColor(.primary)
                }
                .frame(width: 20, height: 20)
                .padding(.leading)
                
                Spacer()
                
                Button{
                    isShowingDetailView.toggle()
                }label: {
                    XButton(frameXY: 44)
            }
            }
          
            Spacer()
            UserListCell(user: user)
            List{
                ForEach (repos, id: \.id) { repo in
                    RepoListCell(repo: repo)
                    
                }
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
        UserDetailView(user: MockData.sampleUser, isShowingDetailView: .constant(false), repos: .constant(MockData.sampleRepos))
    }
}
