//
//  XCTestCase+Helpers.swift
//  EssentialAppTests
//
//  Created by Cleo Howard on 1/13/24.
//

import XCTest
import EssentialFeed

extension XCTestCase {
    func anyURL() -> URL {
        return URL(string: "https://any-url.com")!
    }
    
    func aURL() -> URL {
        return URL(string: "http://a-url.com")!
    }
    
    func anotherURL() -> URL {
        return URL(string: "http://another-url.com")!
    }
    
    func anyNSError() -> NSError {
        return NSError(domain: "any error", code: 0)
    }
    
    func anyData() -> Data {
        return Data("any data".utf8)
    }
    
    func uniqueFeed() -> [FeedImage] {
        return [FeedImage(id: UUID(), description: "any", location: "any", url: anyURL())]
    }
}
