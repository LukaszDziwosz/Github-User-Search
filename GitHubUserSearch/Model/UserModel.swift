//
//  UserModel.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 17/09/2021.
//

import Foundation


struct User: Codable, Identifiable,Equatable, Hashable {

    let id = UUID()
    let login: String
    let avatarURL: String?
    let htmlURL: String
    let reposURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
        case htmlURL = "html_url"
        case reposURL = "repos_url"
    }
}

struct MockData {
    static let sampleUser = User(login: "Alamofire", avatarURL: "https://avatars.githubusercontent.com/u/7774181?s=200&v=4", htmlURL: "https://github.com/Alamofire/Alamofire", reposURL: "https://api.github.com/users/mojombo/repos")
    static let sampleUsers = [sampleUser, sampleUser, sampleUser, sampleUser, sampleUser, sampleUser, sampleUser, sampleUser]
    
    static let sampleRepo = Repos(name: "Alamofire", stars: 10, watchers: 20, language: "Swift")
    static let sampleRepos = [sampleRepo, sampleRepo, sampleRepo, sampleRepo, sampleRepo]
}


//https://docs.github.com/en/rest/reference/search#search-users
