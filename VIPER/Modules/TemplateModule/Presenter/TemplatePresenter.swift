//
//  TemplatePresenter.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation

protocol TemplatePresenterType {

}

class TemplatePresenter: TemplatePresenterType {
    private var interactor: TemplateInteractorType
    private var router: TemplateRouterType

    init(interactor: TemplateInteractorType,
         router: TemplateRouterType) {
        self.interactor = interactor
        self.router = router
    }

}
