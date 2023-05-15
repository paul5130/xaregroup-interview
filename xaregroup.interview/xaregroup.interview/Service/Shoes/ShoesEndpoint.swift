//
//  ShoesEndpoint.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import Foundation

enum ShoesEndpoint{
    case get(category: String = "shoes")
    func url(baseURL: URL) -> URL{
        switch self{
        case let .get(category):
            var components = URLComponents()
            components.scheme = baseURL.scheme
            components.host = baseURL.host
            components.path = baseURL.path + "/\(category)"
            return components.url!
        }
    }
}
