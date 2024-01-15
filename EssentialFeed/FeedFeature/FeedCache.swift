//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 1/15/24.
//

import Foundation

public protocol FeedCache {
    typealias SaveResult = Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (SaveResult) -> Void)
}
