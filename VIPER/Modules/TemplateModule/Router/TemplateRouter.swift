//
//  TemplateRouter.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation
import Swinject

protocol TemplateRouterType {
    
}

class TemplateRouter: TemplateRouterType {
    private var view: TemplateViewType
    private var modulesProvider: AppModulesProviderType
    
    init(view: TemplateViewType,
         modulesProvider: AppModulesProviderType) {
        self.view = view
        self.modulesProvider = modulesProvider
    }

    
    
}
