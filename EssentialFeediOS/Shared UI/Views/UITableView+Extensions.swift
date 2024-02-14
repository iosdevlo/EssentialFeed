//
//  UITableView+Extenstions.swift
//  EssentialFeediOS
//
//  Created by Cleo Howard on 12/31/23.
//

import UIKit

extension UITableView {
    func dequeueResuableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
