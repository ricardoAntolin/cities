//
//  NetworkDataRepository.swift
//  NetworkDataProvider
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//
import RxSwift
import Data

public class NetworkDataRepository: RemoteDataStore {
    private let cityRepository: CityNetworkDataRepository
    
    public init(baseURL: String){
        self.cityRepository = CityNetworkDataRepository(baseURL: baseURL)
    }
    
    public func searchCities(includeCountry: Bool, page: Int, searchString: String?) -> Single<PageableListEntity<CityEntity>> {
        return cityRepository.searchCities(includeCountry: includeCountry,
                                    page: page,
                                    searchString: searchString).map { $0.asDataEntity() }
    }
}
