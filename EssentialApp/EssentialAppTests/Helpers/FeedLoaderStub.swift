//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Cleo Howard on 1/15/24.
//

import EssentialFeed

class FeedLoaderStub: FeedLoader {
    let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
