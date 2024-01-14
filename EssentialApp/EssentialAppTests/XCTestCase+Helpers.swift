//
//  XCTestCase+Helpers.swift
//  EssentialAppTests
//
//  Created by Cleo Howard on 1/13/24.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated Potential memory leak.", file: file, line: line)
        }
    }
}

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
}
