//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Cleo Howard on 12/14/23.
//

import XCTest

extension XCTestCase {
    func anyURL() -> URL {
        return URL(string: "https://any-url.com")!
    }
    
    func anyNSError() -> NSError {
        return NSError(domain: "any error", code: 0)
    }
}
