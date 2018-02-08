//
//  SearchPageSearchPageInteractorTests.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright 2018 Tigerspike. All rights reserved.
//

import Foundation
import XCTest
@testable import VIPER

class SearchPageInteractorTests: XCTestCase {

    var interactor: SearchPageInteractor!

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        interactor = SearchPageInteractor()
    }

    override func tearDown() {
        interactor = nil
        super.tearDown()
    }

    // MARK: - Tests

}
