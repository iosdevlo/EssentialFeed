//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 12/5/23.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
