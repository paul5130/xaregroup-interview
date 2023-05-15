//
//  ShoesMapper.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import Foundation

enum ShoesMapper{
    static func map(data: Data,response: HTTPURLResponse) -> ShoesService.ShoesResult{
        guard response.statusCode == 200, let data = try? JSONDecoder().decode([Shoes].self, from: data) else { return .failure(ShoesServiceAPI.Error.invalidData)}
        return .success(data)
    }
}
