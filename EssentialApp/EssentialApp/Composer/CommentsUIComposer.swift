//
//  CommentsUIComposer.swift
//  EssentialApp
//
//  Created by Cleo Howard on 2/25/24.
//

import UIKit
import Combine
import EssentialFeed
import EssentialFeediOS

public final class CommentsUIComposer {
    private init() {}
        
    public static func commentsComposedWith(commentsLoader: @escaping () -> LocalFeedLoader.Publisher) -> ListViewController {
        let presentationAdapter = LoadResourcePresentationAdapter<[FeedImage], FeedViewAdapter>(loader: commentsLoader)
        
        let feedController = ListViewController.makeWith(title: ImageCommentsPresenter.title)
        feedController.onRefresh = presentationAdapter.loadResource
        
        presentationAdapter.presenter = LoadResourcePresenter(
            loadingView: WeakRefVirtualProxy(feedController),
            resourceView: FeedViewAdapter(controller: feedController,
                                          imageLoader: { _ in Empty<Data, Error>().eraseToAnyPublisher() }),
            errorView: WeakRefVirtualProxy(feedController), mapper: FeedPresenter.map)
        
        return feedController
    }
}
