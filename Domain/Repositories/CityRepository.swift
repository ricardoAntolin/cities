//
//  CityRepository.swift
//  Domain
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//
import RxSwift

public protocol CityRepository {
    func findAllCities() -> Observable<[City]>
    func storeCities(_ cities: [City]) -> Completable
    func findCitiesByNameLike(_ searchString: String) -> Observable<[City]>
    func updateCitiesByPage(_ page: Int) -> Single<PageableList<City>>
    func updateCitiesByNameLike(page: Int, searchString: String) -> Single<PageableList<City>>
}
