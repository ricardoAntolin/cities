//
//  RepositoryProvider.swift
//  square1
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//
import Data
import RealmDataProvider
import NetworkDataProvider
import RealmSwift
import RxSwift

final class RepositoryProvider{
    let cityRepository: CityDataRepository
    
    init(realm: Realm, baseUrl: String, scheduler: ImmediateSchedulerType){
        cityRepository = CityDataRepository(
            localDataStore: CityRealmDataRepository(realm: realm, scheduler: scheduler),
            remoteDataStore: CityNetworkDataRepository(baseURL: baseUrl))
    }
}
