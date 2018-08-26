//
//  FindCitiesByNameLikeUseCase.swift
//  Domain
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift

final public class FindCitiesUseCase {
    let repository: CityRepository
    
    public init(repository: CityRepository){
        self.repository = repository
    }
    
    public func execute(_ searchString: String? = nil) -> Observable<[City]>{
        guard searchString != nil && !searchString!.isEmpty  else {
            return repository.findAllCities()
                .observeOn(MainScheduler.instance)
        }
        
        return repository.findCitiesByNameLike(searchString!)
            .observeOn(MainScheduler.instance)
    }
}
