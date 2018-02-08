//
//  Builder.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation
import UIKit
import Swinject

protocol TemplateBuilderType {
    func buildModule() -> UIViewController?
}

class TemplateBuilder: TemplateBuilderType {
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

        return container.resolve(TemplateViewType.self) as? UIViewController
    }

    private func registerInteractor(in container: Container,
                                    servicesProvider: AppServicesProviderType) {
        container.register(TemplateInteractorType.self) { _ -> TemplateInteractorType in
            // Inject services
            return TemplateInteractor()
        }
    }

    private func registerRouter(in container: Container, modulesProvider: AppModulesProviderType) {
        container.register(TemplateRouterType.self) { (resolver) -> TemplateRouterType in
            let view = resolver.resolve(TemplateViewType.self)!
            return TemplateRouter(view: view,
                                  modulesProvider: modulesProvider)
        }
    }

    private func registerPresenter(in container: Container) {
        container.register(TemplatePresenterType.self) { (resolver) -> TemplatePresenterType in
            let interactor = resolver.resolve(TemplateInteractorType.self)!
            let router = resolver.resolve(TemplateRouterType.self)!
            return TemplatePresenter(interactor: interactor,
                                     router: router)
        }
    }

    private func registerView(in container: Container) {
        container.register(TemplateViewType.self) { _ -> TemplateViewType in
            return TemplateViewController(nibName: nil, bundle: nil)
            }.initCompleted { (resolver, view) in
                guard let view = view as? TemplateViewController else { return }
                let presenter = resolver.resolve(TemplatePresenterType.self)!
                view.presenter = presenter
        }
    }

}
