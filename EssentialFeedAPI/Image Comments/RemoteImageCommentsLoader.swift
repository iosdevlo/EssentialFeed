//
//  RemoteImageCommentsLoader.swift
//  EssentialFeedAPI
//
//  Created by Cleo Howard on 2/2/24.
//

import Foundation
import EssentialFeed

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
