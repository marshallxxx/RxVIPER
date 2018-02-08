//
//  AppConfiguration.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation
import UIKit
import Swinject

protocol AppConfiguratorType {
    func setupRootViewController(in window: UIWindow)
}

class AppConfigurator: AppConfiguratorType {
    private let rootNavigationController: UINavigationController
    private let servicesProvider: AppServicesProviderType
    private let modulesProvider: AppModulesProviderType

    init() {
        self.rootNavigationController = UINavigationController()
        self.servicesProvider = AppServicesProvider()
        self.modulesProvider = AppModulesProvider(appServicesProvider: servicesProvider)
    }

    // MARK: - AppConfigurationType

    func setupRootViewController(in window: UIWindow) {
        guard let initialView = initialViewController() else {
            fatalError("Initial VIPER module not registered!")
        }
        rootNavigationController.isNavigationBarHidden = true
        rootNavigationController.viewControllers = [initialView]
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
    }

    // MARK: - Helpers

    private func initialViewController() -> UIViewController? {
        return modulesProvider.module(for: SearchPageBuilderType.self)?.buildModule()
    }

}
