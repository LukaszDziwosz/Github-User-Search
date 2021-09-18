//
//  ApiModel.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 17/09/2021.
//

import Foundation

struct APIModel: Codable {
 
    let totalCount: Int?
    let items: [User] 
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
    
}
