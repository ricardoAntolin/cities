//
//  LocalDataStore.swift
//  Data
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift

public protocol LocalDataStore {
    func storeCities(_ cities: [CityEntity]) -> Completable
    func findAllCities() -> Observable<[CityEntity]>
    func findCitiesByNameLike(_ searchString: String) -> Observable<[CityEntity]>
}
