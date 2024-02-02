//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Cleo Howard on 12/6/23.
//

import XCTest
import EssentialFeed
import EssentialFeedAPI

class FeedItemsMapperTests: XCTestCase {
    
    func test_map_throwsErrorOnNon200HTTPResponse() throws {
        let samples = [199, 201, 300, 400, 500]
        let json = makeItemsJSON([])

        try samples.forEach { code in
            XCTAssertThrowsError(
                try FeedItemsMapper.map(json, from: HTTPURLResponse(code: code))
            )
        }
    }
    
    func test_map_throwsErrorOn200HTTPResponseWithInvalidJSON() throws {
        let invalidJSON = Data("invalid json".utf8)
        
        XCTAssertThrowsError(
            try FeedItemsMapper.map(invalidJSON, from: HTTPURLResponse(code: 200))
        )
        
    }
    
    func test_map_deliversErrorOn200HTTPResponseWithEmptyJSONList() throws {
        let emptyListJSON = makeItemsJSON([])

        let result = try FeedItemsMapper.map(emptyListJSON, from: HTTPURLResponse(code: 200))
        
        XCTAssertEqual(result, [])
    }
    
    func test_map_deliversItemsOn200HTTPResponseWithValidJSONItems() throws {
        let item1 = makeItem(id: UUID(), imageURL: anyURL())
        
        let item2 = makeItem(id: UUID(), 
                             description: "a description",
                             location: "a location",
                             imageURL: URL(string: "https://another-url.com")!)
        
        let json = makeItemsJSON([item1.json, item2.json])

        let result = try FeedItemsMapper.map(json, from: HTTPURLResponse(code: 200))

        XCTAssertEqual(result, [item1.model, item2.model])
    }
    
    // MARK: - Helpers
    
    private func failure(_ error: RemoteFeedLoader.Error) -> RemoteFeedLoader.Result {
        return .failure(error)
    }

    private func makeItem(id: UUID, description: String? = nil, location: String? = nil, imageURL: URL) -> (model: FeedImage, json: [String: Any]) {
        let item = FeedImage(id: id, description: description, location: location, url: imageURL)
        
        let json = [
            "id": id.uuidString,
            "description": description,
            "location": location,
            "image": imageURL.absoluteString
        ].compactMapValues { $0 }
        
        return (item, json)
    }
    
    private func makeItemsJSON(_ items: [[String: Any]]) -> Data {
        let json = ["items": items]
        return try! JSONSerialization.data(withJSONObject: json)
    }
}

private extension HTTPURLResponse {
    convenience init(code: Int) {
        self.init(url: anyURL(), statusCode: code, httpVersion: nil, headerFields: nil)!
    }
}
