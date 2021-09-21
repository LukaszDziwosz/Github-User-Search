//
//  UserRepos.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 20/09/2021.
//

import Foundation

struct Repos: Codable, Identifiable {
    
    let id = UUID()
    let name: String
    let stars: Int
    let watchers: Int
    let language: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case stars = "stargazers_count"
        case watchers = "watchers_count"
        case language
    }
    
}

