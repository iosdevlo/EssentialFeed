//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 12/8/23.
//

import Foundation

public protocol HTTPClientTask {
    func cancel()
}

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to approriate threads if needed
    ///
    @discardableResult
    func get(from url: URL, completion: @escaping (Result) -> Void) -> HTTPClientTask
}
