//
//  URLSessionRestClient.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation

enum RestClientError: Error {
    case malformedUrl
}

class URLSessionRestClient: RestClient {

    var urlSession: URLSession
    private(set) var globalHeaders: [String: String] = ["Content-Type": "application/json"]

    init(sessionConfiguration: URLSessionConfiguration) {
        self.urlSession = URLSession(configuration: sessionConfiguration)
    }

    // MARK: - RestClient

    func doGet(url: String,
               parameters: [String: String]?,
               headers: [String: String]?,
               onResponse: @escaping RestResultCallback) {
        // Create URL
        guard let url = queryUrl(url: url, parameters: parameters) else {
            onResponse(nil, nil, RestClientError.malformedUrl)
            return
        }

        // Create request
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        let mergedHeaders = headers?.merging(globalHeaders) { (passed, _) -> String in passed }
        request.allHTTPHeaderFields = mergedHeaders ?? globalHeaders

        // Create data task and execute request
        urlSession.dataTask(with: request) { (result, response, error) in
            onResponse(result, response, error)
            }.resume()
    }

    func doPost(url: String,
                parameters: [String: String]?,
                headers: [String: String]?,
                body: Data?, onResponse: @escaping RestResultCallback) {
        // Create URL
        guard let url = queryUrl(url: url, parameters: parameters) else {
            onResponse(nil, nil, RestClientError.malformedUrl)
            return
        }

        // Create request
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.httpBody = body
        let mergedHeaders = headers?.merging(globalHeaders) { (passed, _) -> String in passed }
        request.allHTTPHeaderFields = mergedHeaders ?? globalHeaders

        // Create data task and execute request
        urlSession.dataTask(with: request) { (result, response, error) in
            onResponse(result, response, error)
            }.resume()
    }

    func doPut(url: String,
               parameters: [String: String]?,
               headers: [String: String]?,
               body: Data?,
               onResponse: @escaping RestResultCallback) {
        // Create URL
        guard let url = queryUrl(url: url, parameters: parameters) else {
            onResponse(nil, nil, RestClientError.malformedUrl)
            return
        }

        // Create request
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.put.rawValue
        request.httpBody = body
        let mergedHeaders = headers?.merging(globalHeaders) { (passed, _) -> String in passed }
        request.allHTTPHeaderFields = mergedHeaders ?? globalHeaders

        // Create data task and execute request
        urlSession.dataTask(with: request) { (result, response, error) in
            onResponse(result, response, error)
            }.resume()
    }

    func doDelete(url: String,
                  parameters: [String: String]?,
                  headers: [String: String]?,
                  body: Data?,
                  onResponse: @escaping RestResultCallback) {
        // Create URL
        guard let url = queryUrl(url: url, parameters: parameters) else {
            onResponse(nil, nil, RestClientError.malformedUrl)
            return
        }

        // Create request
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.delete.rawValue
        request.httpBody = body
        let mergedHeaders = headers?.merging(globalHeaders) { (passed, _) -> String in passed }
        request.allHTTPHeaderFields = mergedHeaders ?? globalHeaders

        // Create data task and execute request
        urlSession.dataTask(with: request) { (result, response, error) in
            onResponse(result, response, error)
            }.resume()
    }

    // MARK: - Utils

    func queryUrl(url: String, parameters: [String: String]?) -> URL? {
        guard let queryParams = parameters else {
            return URL(string: url)
        }

        var urlComponents = URLComponents(string: url)
        urlComponents?.queryItems = queryParams.map({ (row: (name: String, value: String)) in
            return URLQueryItem(name: row.name, value: row.value)
        })

        return urlComponents?.url
    }

}
