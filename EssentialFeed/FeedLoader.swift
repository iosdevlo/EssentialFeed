//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 12/5/23.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
