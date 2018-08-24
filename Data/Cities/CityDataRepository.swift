//
//  CityDataRepository.swift
//  Data
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//
import RxSwift

final class CityDataRepository {
    let localDataStore: LocalDataStore
    let remoteDataStore: RemoteDataStore
    
    init(localDataStore: LocalDataStore,
         remoteDataStore: RemoteDataStore){
        self.localDataStore = localDataStore
        self.remoteDataStore = remoteDataStore
    }
    
    func findAllCities() -> Observable<[CityEntity]> {
        return localDataStore.findAllCities()
    }
    
    func storeCities(_ cities: [CityEntity]) -> Completable{
        return localDataStore.storeCities(cities)
    }
    
    func findCitiesByNameLike(_ searchString: String) -> Observable<[CityEntity]> {
        return localDataStore.findCitiesByNameLike(searchString)
    }
    
    func updateCitiesByPage(page: Int) -> Single<PageableListEntity<CityEntity>> {
        return remoteDataStore.searchCities(includeCountry: true, page: page, searchString: nil)
    }
    
    func updateCitiesByNameLike(page: Int, searchString: String) -> Single<PageableListEntity<CityEntity>> {
        return remoteDataStore.searchCities(includeCountry: true, page: page, searchString: searchString)
    }
}
