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

final class CityNetworkDataRepository {
    private let nwDataProvider: NWDataProvider<NWSearchResponse>
    private let path = "city"
    
    init(baseURL: String){
        self.nwDataProvider = NWDataProvider(baseURL)
    }
    
    func searchCities(includeCountry: Bool,
                             page: Int,
                             searchString: String?) -> Single<NWSearchResponse> {
        var params: [String: Any] = ["page": page]
        
        if includeCountry {
            params["include"] = "country"
        }
        
        if let filter = searchString {
            params["filter[0][name][contains]"] = filter
        }
        
        return nwDataProvider.getItem(path)
    }
}
