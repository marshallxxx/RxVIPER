//
//  ShutterstockService.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation
import RxSwift

protocol ShutterstockServiceType {
    func search(for name: String) -> Single<[ShutterstockImage]>
}

class ShutterstockService: ShutterstockServiceType {
    private var restClient: RestClient
    private var baseUrl: String
    private var consumerKey: String
    private var consumerSecret: String

    init(restClient: RestClient,
         baseUrl: String = "https://api.shutterstock.com",
         consumerKey: String = "8c86c-79829-cf514-78bf3-7a516-4e688",
         consumerSecret: String = "8a27e-5f06f-2a4f2-03da5-6fff6-0c1a0") {
        self.restClient = restClient
        self.baseUrl = baseUrl
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
    }

    func search(for name: String) -> Single<[ShutterstockImage]> {
        return .just([])
    }

}
