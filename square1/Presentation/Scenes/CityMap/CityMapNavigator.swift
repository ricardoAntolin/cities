//
//  CityMapNavigator.swift
//  square1
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import UIKit

final class CityMapNavigator: BaseNavigator {
    
    func goToCityMap() {
        let cityMapViewModel = CityMapViewModel(
            findCitiesUseCase: useCaseProvider.findCitiesUseCaseUseCase)

        let cityMapViewController = CityMapViewController()
        cityMapViewController.viewModel = cityMapViewModel
        
        self.navigationController
            .pushViewController(cityMapViewController, animated: false)
    }
}
