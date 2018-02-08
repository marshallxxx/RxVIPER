//
//  SearchPageSearchPagePresenter.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright 2018 Tigerspike. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ImageDetails {
    var description: String
    var url: URL

    fileprivate init?(photo: Photo) {
        guard let url = URL(string: photo.url) else { return nil }
        self.description = photo.description
        self.url = url
    }
}

protocol SearchPagePresenterType {
    func images(for query: String) -> Driver<[ImageDetails]>
}

class SearchPagePresenter: SearchPagePresenterType {
    private var interactor: SearchPageInteractorType
    private var router: SearchPageRouterType

    init(interactor: SearchPageInteractorType,
         router: SearchPageRouterType) {
        self.interactor = interactor
        self.router = router
    }

    func images(for query: String) -> Driver<[ImageDetails]> {
        return interactor.searchImages(for: query)
            .map { $0.flatMap { ImageDetails(photo: $0) } }
            .asDriver(onErrorJustReturn: [])
    }

}
