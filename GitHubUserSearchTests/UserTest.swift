//
//  UserTest.swift
//  GitHubUserSearchTests
//
//  Created by Lukasz Dziwosz on 22/09/2021.
//

import XCTest
@testable import GitHubUserSearch

class UserTest: GitHubUserSearchTests {

    func test_model() {
        XCTAssertEqual(testUser.login, testLogin)
        XCTAssertEqual(testUser.avatarURL, testAvatarURL)
        XCTAssertEqual(testUser.htmlURL, testHtmlUrl)
        XCTAssertEqual(testUser.reposURL, testReposUrl)
    }

}

