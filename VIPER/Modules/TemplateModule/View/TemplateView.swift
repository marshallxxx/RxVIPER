//
//  TemplateView.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol TemplateViewType where Self: UIViewController {

}

class TemplateViewController: UIViewController, TemplateViewType {
    var presenter: TemplatePresenterType!

}
