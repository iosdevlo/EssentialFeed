//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Cleo Howard on 12/14/23.
//

import Foundation

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

