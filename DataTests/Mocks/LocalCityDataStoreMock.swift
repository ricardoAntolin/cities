//
//  LocalCityDataStore.swift
//  DataTests
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift
@testable import Data

final class LocalCityDataStoreMock: LocalCityDataStore {
    func storeCities(_ cities: [CityEntity]) -> Completable {
        return Completable.empty()
    }
    
    func findAllCities() -> Observable<[CityEntity]> {
        return Observable.just(ExpectedResults.createTwoCities())
    }
    
    func findCitiesByNameLike(_ searchString: String) -> Observable<[CityEntity]> {
        return Observable.just([ExpectedResults.createOneCity()])
    }
}
