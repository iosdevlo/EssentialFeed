//
//  FeedViewController+Extensions.swift
//  EssentialFeediOS
//
//  Created by Cleo Howard on 1/2/24.
//

import UIKit

extension ListViewController {
    static public func makeWith(delegate: FeedViewControllerDelegate, title: String) -> ListViewController {
        let bundle = Bundle(for: ListViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        
        let feedController = storyboard.instantiateInitialViewController() as! ListViewController
        feedController.delegate = delegate
        feedController.title = title
        return feedController
    }
}
