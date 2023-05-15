//
//  HTTPClient.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import Foundation

protocol HTTPClientTask{
    func cancel()
}
protocol HTTPClient{
    typealias HTTPResult = Result<(Data,HTTPURLResponse),Error>
    @discardableResult
    func get(from url: URL,completion: @escaping (HTTPResult) -> Void) -> HTTPClientTask
}

class URLSessionHTTPClient: HTTPClient{
    private let session: URLSession
    private struct UnexpectedValuesRepresentation: Error {}
    private struct URLSessionTaskWrapper: HTTPClientTask{
        let wrapped: URLSessionTask
        func cancel() {
            wrapped.cancel()
        }
    }
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get(from url: URL, completion: @escaping (HTTPResult) -> Void) -> HTTPClientTask {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("5c07b642dcmsh8f8672daa49f40dp1964e5jsnb96d2db51f3c", forHTTPHeaderField: "X-RapidAPI-Key")
        request.addValue("shoes-collections.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        let task = session.dataTask(with: request) { data, response, error in
            completion(Result {
                if let error = error {
                    throw error
                } else if let data = data, let response = response as? HTTPURLResponse {
                    return (data, response)
                } else {
                    throw UnexpectedValuesRepresentation()
                }
            })
        }
        task.resume()
        return URLSessionTaskWrapper(wrapped: task)
    }
}
