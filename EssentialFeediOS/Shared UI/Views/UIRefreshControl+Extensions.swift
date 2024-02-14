//
//  UIRefreshControl.swift
//  EssentialFeediOS
//
//  Created by Cleo Howard on 1/6/24.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
