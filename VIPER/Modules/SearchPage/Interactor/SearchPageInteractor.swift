//
//  SearchPageSearchPageInteractor.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright 2018 Tigerspike. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchPageInteractorType {
    func searchImages(for query: String) -> Single<[Photo]>
}

class SearchPageInteractor: SearchPageInteractorType {
    private var shutterstockService: ShutterstockServiceType

    init(shutterstockService: ShutterstockServiceType) {
        self.shutterstockService = shutterstockService
    }

    func searchImages(for query: String) -> Single<[Photo]> {
        return shutterstockService.search(for: query)
            .map { $0.map { Photo(shutterstockImage: $0) } }
    }

}

extension Photo {
    init(shutterstockImage: ShutterstockImage) {
        self.id = shutterstockImage.id
        self.description = shutterstockImage.description ?? ""
        self.url = shutterstockImage.url ?? ""
    }
}
