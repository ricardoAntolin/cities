//
//  DataRepository.swift
//  Data
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift
import Domain

public final class DataRepository {
    private let remoteDataStore: RemoteDataStore
    private let localDataStore: LocalDataStore
    
    public init(remoteDataStore: RemoteDataStore,
                localDataStore: LocalDataStore){
        self.remoteDataStore = remoteDataStore
        self.localDataStore = localDataStore
    }
    
    public func searchCities(includeCountry: Bool, page: Int, searchString: String?) -> Single<PageableListEntity<CityEntity>> {
        return remoteDataStore.searchCities(includeCountry: includeCountry, page: page, searchString: searchString)
    }
}
