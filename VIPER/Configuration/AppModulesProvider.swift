//
//  AppModulesProvider.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation
import Swinject

protocol AppModulesProviderType {
    func module<Module>(for builderType: Module.Type) -> Module?
}

class AppModulesProvider: AppModulesProviderType {
    private var modulesContainer: Container
    private var appServicesProvider: AppServicesProviderType

    init(appServicesProvider: AppServicesProviderType) {
        self.modulesContainer = Container()
        self.appServicesProvider = appServicesProvider
        registerModules()
    }

    func module<Module>(for builderType: Module.Type) -> Module? {
        return modulesContainer.resolve(builderType)
    }

    // MARK: - Module registration

    private func registerModules() {
        registerSearchPageModule(in: modulesContainer, with: appServicesProvider)
    }

    private func registerSearchPageModule(in container: Container,
                                          with serviceProvider: AppServicesProviderType) {
        container.register(SearchPageBuilderType.self) { (resolver) -> SearchPageBuilderType in
            return SearchPageBuilder(appServicesProvider: serviceProvider,
                                     appModulesProvider: self)
        }
    }

}
