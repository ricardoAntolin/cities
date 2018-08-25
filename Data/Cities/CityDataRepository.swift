//
//  CityDataRepository.swift
//  Data
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//
import RxSwift
import Domain

public final class CityDataRepository: CityRepository {
    let localDataStore: LocalCityDataStore
    let remoteDataStore: RemoteCityDataStore
    
    public init(localDataStore: LocalCityDataStore,
                remoteDataStore: RemoteCityDataStore){
        self.localDataStore = localDataStore
        self.remoteDataStore = remoteDataStore
    }
    
    public func findAllCities() -> Observable<[City]> {
        return localDataStore.findAllCities()
            .map{ $0.map{ $0.asDomainModel() } }
    }
    
    public func storeCities(_ cities: [City]) -> Completable{
        return localDataStore.storeCities(cities.map{ $0.asDataEntity() })
    }
    
    public func findCitiesByNameLike(_ searchString: String) -> Observable<[City]> {
        return localDataStore.findCitiesByNameLike(searchString)
            .map{ $0.map{ $0.asDomainModel() } }
    }
    
    public func updateCitiesByPage(_ page: Int) -> Single<PageableList<City>> {
        return remoteDataStore.searchCities(includeCountry: true, page: page, searchString: nil)
            .map{ $0.asDomainModel() }
    }
    
    public func updateCitiesByNameLike(page: Int, searchString: String) -> Single<PageableList<City>> {
        return remoteDataStore.searchCities(includeCountry: true, page: page, searchString: searchString)
            .map{ $0.asDomainModel() }
    }
}
