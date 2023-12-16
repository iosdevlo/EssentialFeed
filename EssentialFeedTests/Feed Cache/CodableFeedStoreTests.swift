//
//  CodableFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by Cleo Howard on 12/15/23.
//

import XCTest
import EssentialFeed

class CodableFeedStore {
    func retrieve(completion: @escaping FeedStore.RetrievalCompletion) {
        completion(.empty)
    }
}

class CodableFeedStoreTests: XCTestCase {

    func test_retrieve_deliversEmptyOnEmptyCache() {
        let sut = CodableFeedStore()
        
        let expectation = expectation(description: "Wait for cache retrieval")
        sut.retrieve { result in
            switch result {
                
            case .empty:
                break
            
            default:
                XCTFail("Expected failure, got \(result) instead")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
