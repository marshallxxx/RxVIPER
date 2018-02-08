//
//  SearchPageHeaderView.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation
import UIKit

class SearchPageHeaderView: UIView {
    private var textField: UITextField = .make()

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    private func layout() {
        self.addSubview(textField)
    }

}

private extension UITextField {
    static func make() -> UITextField {
        let textfield = UITextField()
        textfield.borderStyle = .bezel
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }
}
