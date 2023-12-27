//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 12/5/23.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    func load(completion: @escaping (Result) -> Void)
}
