//
//  UserModel.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 17/09/2021.
//

import Foundation


struct User: Codable, Identifiable,Equatable, Hashable {

    let id: Int
    let login: String
    let avatarURL: String?
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
        case url
    }
}

struct MockData {
    static let sampleUser = User(id: 001, login: "Alamofire", avatarURL: "https://avatars.githubusercontent.com/u/7774181?s=200&v=4", url: "https://github.com/Alamofire/Alamofire")
    static let sampleUsers = [sampleUser, sampleUser, sampleUser, sampleUser, sampleUser, sampleUser, sampleUser, sampleUser]
}


//https://docs.github.com/en/rest/reference/search#search-users
