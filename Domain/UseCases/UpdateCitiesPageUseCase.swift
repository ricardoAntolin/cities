//
//  UpdateCitiesPageUseCase.swift
//  Domain
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift

final public class UpdateCitiesPageUseCase {
    let repository: CityRepository
    let scheduler: ImmediateSchedulerType
    let disposeBag = DisposeBag()
    
    public init(repository: CityRepository,
                scheduler: ImmediateSchedulerType){
        self.repository = repository
        self.scheduler = scheduler
    }
    
    public func execute(page: Int) -> Single<PageableList<City>> {
        return repository.updateCitiesByPage(page)
            .observeOn(scheduler)
            .do(onSuccess: { self.storeResults(cities: $0.items) })
    }
    
    private func storeResults(cities: [City]) {
        return repository.storeCities(cities)
            .subscribe()
            .disposed(by: disposeBag)
    }
}
