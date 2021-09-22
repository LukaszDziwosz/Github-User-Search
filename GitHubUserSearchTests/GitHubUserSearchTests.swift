//
//  GitHubUserSearchTests.swift
//  GitHubUserSearchTests
//
//  Created by Lukasz Dziwosz on 22/09/2021.
//

import XCTest
@testable import GitHubUserSearch

class GitHubUserSearchTests: XCTestCase {
    
    let testTotalCount = 1
    let testLogin = "testlogin"
    let testAvatarURL = "https://i.pravatar.cc/70"
    let testHtmlUrl = "https://github.com/mojombo"
    let testReposUrl = "https://api.github.com/users/mojombo/repos"
    var testUser: User {
        User(login: testLogin, avatarURL: testAvatarURL, htmlURL: testHtmlUrl, reposURL: testReposUrl)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
