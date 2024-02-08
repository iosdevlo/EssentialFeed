//
//  LoadResourcePresenter.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 2/8/24.
//

import Foundation

public protocol ResourceView {
    associatedtype ResourceViewModel
    
    func display(_ viewModel: ResourceViewModel)
}

public class LoadResourcePresenter<Resource, View: ResourceView> {
    public typealias Mapper = (Resource) -> View.ResourceViewModel
    
    private let loadingView: ResourceLoadingView
    private let resourceView: View
    private let errorView: FeedErrorView
    private let mapper: Mapper
    
    public init(loadingView: ResourceLoadingView, resourceView: View, errorView: FeedErrorView, mapper: @escaping Mapper) {
        self.loadingView = loadingView
        self.resourceView = resourceView
        self.errorView = errorView
        self.mapper = mapper
    }
    
    public static var loadError: String {
        return NSLocalizedString("GENERIC_CONNECTION_ERROR",
                                 tableName: "Shared",
                                 bundle: Bundle(for: Self.self),
                                 comment: "Error message displayed when we can't load the resource from the server")
    }
    
    public func didStartLoading() {
        errorView.display(.noError)
        loadingView.display(ResourceLoadingViewModel(isLoading: true))
    }
    
    public func didFinishLoading(with resource: Resource) {
        resourceView.display(mapper(resource))
        loadingView.display(ResourceLoadingViewModel(isLoading: false))
    }
    
    public func didFinishLoading(with error: Error) {
        errorView.display(.error(message: Self.loadError))
        loadingView.display(ResourceLoadingViewModel(isLoading: false))
    }
}
