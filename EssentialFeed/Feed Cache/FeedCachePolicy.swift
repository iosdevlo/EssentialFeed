//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 12/14/23.
//

import Foundation

final class FeedCachePolicy {
    private init() {}
    
    private static var maxCacheAgeInDays: Int { return 7 }
    
    static func validate(_ timestamp: Date, against date: Date) -> Bool {
        let calendar = Calendar(identifier: .gregorian)
        guard let maxCachedAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else { return false }
        return date < maxCachedAge
    }
}
