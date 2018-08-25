//
//  findAllCitiesUseCase.swift
//  Domain
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift

final public class FindAllCitiesUseCase {
    let repository: CityRepository
    
    public init(repository: CityRepository){
        self.repository = repository
    }
    
    public func execute() -> Observable<[City]>{
        return repository.findAllCities()
            .observeOn(MainScheduler.instance)
    }
}
