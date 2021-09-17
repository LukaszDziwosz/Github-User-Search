//
//  ApiModel.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 17/09/2021.
//

import Foundation

struct ApiModel: Codable {
 
    let totalCount: Int?
    let items: [User] //try creating array on the fly
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
    
}