//
//  SearchPageSearchPagePresenterTests.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright 2018 Tigerspike. All rights reserved.
//

import Foundation
import XCTest
@testable import VIPER

class SearchPagePresenterTests: XCTestCase {

    var router: SearchPageRouterMock!
    var interactor: SearchPageInteractorMock!
    var presenter: SearchPagePresenter!

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        interactor = SearchPageInteractorMock()
        router = SearchPageRouterMock()
        presenter = SearchPagePresenter(interactor: interactor,
                                      router: router)
    }

    override func tearDown() {
        interactor = nil
        router = nil
        presenter = nil
        super.tearDown()
    }

    // MARK: - Tests

}

class SearchPageRouterMock: SearchPageRouterType {

}

class SearchPageInteractorMock: SearchPageInteractorType {

}
