//
//  FeedViewController+Extensions.swift
//  EssentialFeediOS
//
//  Created by Cleo Howard on 1/2/24.
//

import UIKit

extension FeedViewController {
    static public func makeWith(delegate: FeedViewControllerDelegate, title: String) -> FeedViewController {
        let bundle = Bundle(for: FeedViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        
        let feedController = storyboard.instantiateInitialViewController() as! FeedViewController
        feedController.delegate = delegate
        feedController.title = title
        return feedController
    }
}
