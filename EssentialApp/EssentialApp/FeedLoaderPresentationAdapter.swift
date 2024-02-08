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
    private let feedLoader: () -> LocalFeedLoader.Publisher
    private var cancellable: Cancellable?
    var presenter: LoadResourcePresenter<[FeedImage], FeedViewAdapter>?
    
    init(feedLoader: @escaping () -> LocalFeedLoader.Publisher) {
        self.feedLoader = feedLoader
    }
    
    public func didRequestFeedRefresh() {
        presenter?.didStartLoading()
        
        cancellable = feedLoader().sink { [weak self] completion in
            switch completion {
                
            case .finished: break
            case .failure(let error):
                self?.presenter?.didFinishLoading(with: error)
            }
        } receiveValue: { [weak self] feed in
            self?.presenter?.didFinishLoading(with: feed)
        }
    }
}
