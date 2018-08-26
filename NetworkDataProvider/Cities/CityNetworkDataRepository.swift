//
//  CityNetworkDataRepository.swift
//  NetworkDataProvider
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxAlamofire
import RxSwift
import RxCodable
import Data

public final class CityNetworkDataRepository: RemoteCityDataStore {
    private let nwDataProvider: NWDataProvider<NWSearchResponse>
    private let path = "/city"
    
    public init(baseURL: String){
        self.nwDataProvider = NWDataProvider(baseURL)
    }
    
    public func searchCities(includeCountry: Bool,
                             page: Int,
                             searchString: String?) -> Single<PageableListEntity<CityEntity>> {
        var params: [String: Any] = ["page": page]
        
        if includeCountry {
            params["include"] = "country"
        }
        
        if let filter = searchString {
            params["filter[0][name][contains]"] = filter
        }
        
        return nwDataProvider.getItem(path, parameters: params).map { $0.asDataEntity() }
    }
}
