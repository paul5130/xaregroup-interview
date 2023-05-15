//
//  ShoesService.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import Foundation

protocol ShoesService{
    typealias ShoesResult = Result<[Shoes],Error>
    func load(completion: @escaping(ShoesResult) -> Void)
}

class ShoesServiceAPI: ShoesService{
    private let url: URL
    private let client: HTTPClient
    enum Error: Swift.Error{
        case connectivity
        case invalidData
    }
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    func load(completion: @escaping (ShoesResult) -> Void) {
        client.get(from: url) {[weak self] result in
            guard self != nil else { return }
            switch result{
            case let .success((data, response)):
                completion(ShoesMapper.map(data: data, response: response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
