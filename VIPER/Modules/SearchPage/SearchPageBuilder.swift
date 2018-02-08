//
//  SearchPageSearchPageBuilder.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright 2018 Tigerspike. All rights reserved.
//

import Foundation
import UIKit
import Swinject

protocol SearchPageBuilderType {
    func buildModule() -> UIViewController?
}

class SearchPageBuilder: SearchPageBuilderType {
    private let appServicesProvider: AppServicesProviderType
    private let appModulesProvider: AppModulesProviderType

    init(appServicesProvider: AppServicesProviderType,
         appModulesProvider: AppModulesProviderType) {
        self.appServicesProvider = appServicesProvider
        self.appModulesProvider = appModulesProvider
    }

    func buildModule() -> UIViewController? {
        let container = Container()
        registerInteractor(in: container, servicesProvider: appServicesProvider)
        registerRouter(in: container, modulesProvider: appModulesProvider)
        registerPresenter(in: container)
        registerView(in: container)

        return container.resolve(SearchPageViewType.self) as? UIViewController
    }

    private func registerInteractor(in container: Container,
                                    servicesProvider: AppServicesProviderType) {
        container.register(SearchPageInteractorType.self) { _ -> SearchPageInteractorType in
            let shutterstockService = servicesProvider.service(for: ShutterstockServiceType.self)!
            return SearchPageInteractor(shutterstockService: shutterstockService)
        }
    }

    private func registerRouter(in container: Container, modulesProvider: AppModulesProviderType) {
        container.register(SearchPageRouterType.self) { (resolver) -> SearchPageRouterType in
            let view = resolver.resolve(SearchPageViewType.self)!
            return SearchPageRouter(view: view,
                                  modulesProvider: modulesProvider)
        }
    }

    private func registerPresenter(in container: Container) {
        container.register(SearchPagePresenterType.self) { (resolver) -> SearchPagePresenterType in
            let interactor = resolver.resolve(SearchPageInteractorType.self)!
            let router = resolver.resolve(SearchPageRouterType.self)!
            return SearchPagePresenter(interactor: interactor,
                                     router: router)
        }
    }

    private func registerView(in container: Container) {
        container.register(SearchPageViewType.self) { _ -> SearchPageViewType in
            return SearchPageViewController(nibName: nil, bundle: nil)
            }.initCompleted { (resolver, view) in
                guard let view = view as? SearchPageViewController else { return }
                let presenter = resolver.resolve(SearchPagePresenterType.self)!
                view.presenter = presenter
        }
    }

}
