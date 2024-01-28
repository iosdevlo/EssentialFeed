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
    
    public static func feedComposedWith(feedLoader: @escaping () -> FeedLoader.Publisher, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader: { feedLoader().dispatchOnMainQueue() })
        
        let feedController = FeedViewController.makeWith(delegate: presentationAdapter, title: FeedPresenter.title)
        
        presentationAdapter.presenter = FeedPresenter(
            loadingView: WeakRefVirtualProxy(feedController),
            feedView: FeedViewAdapter(controller: feedController,
                                      imageLoader: MainQueueDispatchDecorator(decoratee: imageLoader)), 
            errorView: WeakRefVirtualProxy(feedController))
        
        return feedController
    }
}
