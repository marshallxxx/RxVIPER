//
//  AppServicesProvider.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation
import Swinject

protocol AppServicesProviderType {
    func service<Service>(for serviceType: Service.Type) -> Service?
}

class AppServicesProvider: AppServicesProviderType {
    private var serviceContainer: Container

    init() {
        self.serviceContainer = Container()
        registerServices()
    }

    func service<Service>(for serviceType: Service.Type) -> Service? {
        return serviceContainer.resolve(serviceType)
    }
    
    // MARK: - Register App Services

    private func registerServices() {
        registerRestClient(in: serviceContainer)
        registerShutterstockService(in: serviceContainer)
    }

    private func registerRestClient(in container: Container) {
        container.register(RestClient.self) { _ -> RestClient in
            let urlSessionConfiguration = URLSessionConfiguration.default
            return URLSessionRestClient(sessionConfiguration: urlSessionConfiguration)
        }
    }

    private func registerShutterstockService(in container: Container) {
        container.register(ShutterstockServiceType.self) { (resolver) -> ShutterstockServiceType in
            let restClient = resolver.resolve(RestClient.self)!
            return ShutterstockService(restClient: restClient)
        }
    }

}
