//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Cleo Howard on 12/26/23.
//

import UIKit
import Combine
import EssentialFeed
import EssentialFeediOS

public final class FeedUIComposer {
    private init() {}
    
    public static func feedComposedWith(feedLoader: @escaping () -> LocalFeedLoader.Publisher, 
                                        imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher) -> FeedViewController {
        let presentationAdapter = LoadResourcePresentationAdapter<[FeedImage], FeedViewAdapter>(loader: feedLoader)
        
        let feedController = FeedViewController.makeWith(delegate: presentationAdapter, title: FeedPresenter.title)
        
        presentationAdapter.presenter = LoadResourcePresenter(
            loadingView: WeakRefVirtualProxy(feedController),
            resourceView: FeedViewAdapter(controller: feedController,
                                      imageLoader: { imageLoader($0).dispatchOnMainQueue() }),
            errorView: WeakRefVirtualProxy(feedController), mapper: FeedPresenter.map)
        
        return feedController
    }
}
