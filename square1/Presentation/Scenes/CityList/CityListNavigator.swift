//
//  CityListNavigator.swift
//  square1
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import UIKit

final class CityListNavigator: BaseNavigator {
    
    func goToCityList(){
        let cityListViewModel =
            CityListViewModel(
                findCitiesUseCase: useCaseProvider.findCitiesUseCaseUseCase,
                updateCitiesByNameLikeAndPageUseCase: useCaseProvider.updateCitiesByNameLikeAndPageUseCase)
        
        let cityListViewController = CityListViewController()
        cityListViewController.viewModel = cityListViewModel
        
        self.navigationController
            .pushViewController(cityListViewController, animated: false)
    }
}
