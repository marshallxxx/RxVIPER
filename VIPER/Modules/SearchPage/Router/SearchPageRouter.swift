//
//  SearchPageSearchPageRouter.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright 2018 Tigerspike. All rights reserved.
//

import Foundation
import Swinject

protocol SearchPageRouterType {

}

class SearchPageRouter: SearchPageRouterType {
    private var view: SearchPageViewType
    private var modulesProvider: AppModulesProviderType

    init(view: SearchPageViewType,
         modulesProvider: AppModulesProviderType) {
        self.view = view
        self.modulesProvider = modulesProvider
    }

}
