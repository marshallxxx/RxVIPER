//
//  SearchPageSearchPageTemplateView.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright 2018 Tigerspike. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol SearchPageViewType where Self: UIViewController {

}

class SearchPageViewController: UIViewController, SearchPageViewType {
    var presenter: SearchPagePresenterType!

    private var collectionView: UICollectionView = .make()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white

        layout()
    }

    private func layout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
    }

}

private extension SearchPageViewController {
    struct Metric {
        private init() {}
        static let textfieldWidth = UIScreen.main.bounds.width * 0.7
    }
}

private extension UICollectionView {
    static func make() -> UICollectionView {
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
}
