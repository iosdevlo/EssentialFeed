//
//  ImageCommentsPresenter.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 2/10/24.
//

import Foundation

public final class ImageCommentsPresenter {
    public static var title: String {
        return NSLocalizedString("IMAGE_COMMENTS_VIEW_TITLE",
                                 tableName: "ImageComments",
                                 bundle: Bundle(for: Self.self),
                                 comment: "Title for the Image Comments View")
    }
}
