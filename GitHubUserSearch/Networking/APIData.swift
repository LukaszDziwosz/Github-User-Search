//
//  APIData.swift
//  GitHubUserSearch
//
//  Created by Lukasz Dziwosz on 17/09/2021.
//

import Foundation
import Combine

enum APIData {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://api.github.com")!
    static let defaultHeaders = [
        "accept": "application/vnd.github.v3+json",
    ]
}

enum APIEndpoint: String {
    case searchUsers = "/search/users"
}
//https://docs.github.com/en/rest/reference/search#search-users
extension APIData {
    
    static func usersRequest(_ path: APIEndpoint, username: String, page: Int) -> AnyPublisher<APIModel, Error> {
        
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
        else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [URLQueryItem(name: "q", value: username), URLQueryItem(name: "page", value: "\(page)")]

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = defaultHeaders
        
         return apiClient.run(request)
             .map(\.value)
             .eraseToAnyPublisher()
     }
    static func repoRequest(urlString: String) -> AnyPublisher<[Repos], Error> {
        guard let url = URL(string: urlString) else { fatalError("Bad repository URL") }
        let request = URLRequest(url: url)
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
