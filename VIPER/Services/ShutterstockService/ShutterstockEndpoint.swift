//
//  ShutterstockEndpoint.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation

struct ShutterstockAuthorization {
    var clientId: String
    var clientSecret: String
}

enum ShutterstockEndpoint {
    case search(ShutterstockAuthorization, String)

    func buildUrlReques(with baseUrl: String) -> URLRequest? {
        guard let url = url(with: baseUrl) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body

        return request
    }

    private func url(with baseUrl: String) -> URL? {
        var components = URLComponents(string: baseUrl)

        switch self {
        case .search(let authorization, let query):
            components?.user = authorization.clientId
            components?.password = authorization.clientSecret
            components?.path = "/v2/images/search?query=\(query)"
        }

        return components?.url
    }

    var method: String {
        switch self {
        case .search:
            return HTTPMethod.post.rawValue
        }
    }

    var body: Data? {
        return nil
    }
}
