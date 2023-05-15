//
//  Shoes.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import Foundation

struct Shoes: Decodable{
    let id: Int
    let name: String
    let price: Double
    let image: String
    let description: String
    let quantity: Int
    let rating: Rating
}
struct Rating: Decodable{
    let rate: Double
    let count: Int
}
