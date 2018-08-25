//
//  UseCaseProvider.swift
//  square1
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//
import Domain
import RxSwift

final class UseCaseProvider {
    let findAllCitiesUSeCase: FindAllCitiesUseCase
    let updateCitiesPageUseCase: UpdateCitiesPageUseCase
    let findCitiesByNameLikeUseCase: FindCitiesByNameLikeUseCase
    let updateCitiesByNameLikeAndPageUseCase: UpdateCitiesByNameLikeAndPageUseCase
    
    init(repositoryProvider: RepositoryProvider,
         scheduler: ImmediateSchedulerType) {
        self.findAllCitiesUSeCase =
            FindAllCitiesUseCase(repository: repositoryProvider.cityRepository)
        
        self.updateCitiesPageUseCase =
            UpdateCitiesPageUseCase(
                repository: repositoryProvider.cityRepository,
                scheduler: scheduler)
        
        self.findCitiesByNameLikeUseCase =
            FindCitiesByNameLikeUseCase(repository: repositoryProvider.cityRepository)
        
        self.updateCitiesByNameLikeAndPageUseCase =
            UpdateCitiesByNameLikeAndPageUseCase(
                repository: repositoryProvider.cityRepository,
                scheduler: scheduler)
    }
    
}
