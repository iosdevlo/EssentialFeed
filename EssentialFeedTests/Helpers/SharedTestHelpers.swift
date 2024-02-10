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

extension HTTPURLResponse {
    convenience init(code: Int) {
        self.init(url: anyURL(), statusCode: code, httpVersion: nil, headerFields: nil)!
    }
}

extension Date {
    func adding(seconds: TimeInterval) -> Date {
        return self + seconds
    }
    
    func adding(minutes: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .minute, value: minutes, to: self)!
    }
    
    func adding(days: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self)!
    }
}

