//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by Cleo Howard on 1/2/24.
//

import Combine
import EssentialFeed
import EssentialFeediOS

public final class FeedLoaderPresentationAdapter: FeedViewControllerDelegate {
    private let feedLoader: () -> FeedLoader.Publisher
    private var cancellable: Cancellable?
    var presenter: FeedPresenter?
    
    init(feedLoader: @escaping () -> FeedLoader.Publisher) {
        self.feedLoader = feedLoader
    }
    
    public func didRequestFeedRefresh() {
        presenter?.didStartLoadingFeed()
        
        cancellable = feedLoader().sink { [weak self] completion in
            switch completion {
                
            case .finished: break
            case .failure(let error):
                self?.presenter?.didFinishLoadingFeed(with: error)
            }
        } receiveValue: { [weak self] feed in
            self?.presenter?.didFinishLoadingFeed(with: feed)
        }
    }
}