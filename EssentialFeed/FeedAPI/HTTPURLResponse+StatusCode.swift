//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 1/9/24.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
