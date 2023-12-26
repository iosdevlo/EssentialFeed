//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 12/13/23.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
