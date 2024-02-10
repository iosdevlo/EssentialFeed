//
//  FeedImagePresenter.swift
//  EssentialFeediOS
//
//  Created by Cleo Howard on 12/28/23.
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
