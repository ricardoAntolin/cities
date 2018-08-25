//
//  RemoteDataStore.swift
//  Data
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift

public protocol RemoteCityDataStore {
    func searchCities(includeCountry: Bool, page: Int, searchString: String?) -> Single<PageableListEntity<CityEntity>>
}
