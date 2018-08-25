//
//  BaseNavigator.swift
//  square1
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import UIKit

class BaseNavigator {
    let navigationController: UINavigationController
    let useCaseProvider: UseCaseProvider
    
    init(navigationController: UINavigationController, useCaseProvider: UseCaseProvider) {
        self.navigationController = navigationController
        self.useCaseProvider = useCaseProvider
    }
}

