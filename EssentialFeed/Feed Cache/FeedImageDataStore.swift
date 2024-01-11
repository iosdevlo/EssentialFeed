//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 1/10/24.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
