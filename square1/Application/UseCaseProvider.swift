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
    let findCitiesUseCaseUseCase: FindCitiesUseCase
    let updateCitiesByNameLikeAndPageUseCase: UpdateCitiesByNameLikeAndPageUseCase
    
    init(repositoryProvider: RepositoryProvider,
         scheduler: ImmediateSchedulerType) {
                
        self.findCitiesUseCaseUseCase =
            FindCitiesUseCase(repository: repositoryProvider.cityRepository)
        
        self.updateCitiesByNameLikeAndPageUseCase =
            UpdateCitiesByNameLikeAndPageUseCase(
                repository: repositoryProvider.cityRepository,
                scheduler: scheduler)
    }
    
}
