//
//  CityRepositoryMock.swift
//  DomainTests
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift
@testable import Domain

class CityRepositoryMock: CityRepository {
    var storeCitiesWasCalled = false
    func findAllCities() -> Observable<[City]> {
        return Observable.just(ExpectedResults.twoCitiesResult)
    }
    
    func storeCities(_ cities: [City]) -> Completable {
        storeCitiesWasCalled = true
        return Completable.empty()
    }
    
    func findCitiesByNameLike(_ searchString: String) -> Observable<[City]> {
        if searchString == "har" {
            return Observable.just(ExpectedResults.oneCityResult)
        }
        
        return Observable.error(RxError.noElements)
    }
    
    func updateCitiesByPage(_ page: Int) -> Single<PageableList<City>> {
        return Single.just(ExpectedResults.pageableListPerPageResult)
    }
    
    func updateCitiesByNameLike(page: Int, searchString: String) -> Single<PageableList<City>> {
        return Single.just(ExpectedResults.pageableListResult)
    }
}
