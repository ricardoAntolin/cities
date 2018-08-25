//
//  RemoteCityDataStoreMock.swift
//  DataTests
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift
@testable import Data

final class RemoteCityDataStoreMock: RemoteCityDataStore {
    func searchCities(includeCountry: Bool, page: Int, searchString: String?) -> Single<PageableListEntity<CityEntity>> {
        if searchString == "daha" {
            return Single.just(
                PageableListEntity(
                    items: [ExpectedResults.createOneCity()],
                    currentPage: 0,
                    lastPage: 0,
                    perPage: 1,
                    total: 1
                )
            )
        }
        
        if page == 1 {
            return Single.just(
                PageableListEntity(
                    items: ExpectedResults.createTwoCities(),
                    currentPage: 1,
                    lastPage: 1,
                    perPage: 15,
                    total: 17
                )
            )
        }
        
        return Single.just(
            PageableListEntity(
                items: ExpectedResults.createTwoCities(),
                currentPage: 0,
                lastPage: 1,
                perPage: 15,
                total: 30
            )
        )
    }
}
