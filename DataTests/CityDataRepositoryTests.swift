//
//  DataTests.swift
//  DataTests
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import XCTest
import Nimble
import RxSwift
import RxBlocking
@testable import Data

class DataTests: XCTestCase {
    var repository: CityDataRepository!
    
    override func setUp() {
        super.setUp()
        repository = CityDataRepository(
            localDataStore: LocalCityDataStoreMock(),
            remoteDataStore: RemoteCityDataStoreMock()
        )
    }

    func testFindAll() throws {
        let result = try repository.findAllCities()
            .toBlocking().first()
        
        expect(result).to(haveCount(2))
        expect(result).to(equal(ExpectedResults.twoCitiesResult))
    }
    
    func testStoreCities() throws {
        let storeResult = repository.storeCities(ExpectedResults.oneCityResult).toBlocking().materialize()
        
        switch storeResult {
        case .failed(elements: _, error: let error):
            XCTFail(error.localizedDescription)
        default:
            print("Stored ok")
        }
    }
    
    func testFindCitiesByNameLike() throws {
        let result = try repository.findCitiesByNameLike("daha")
            .toBlocking().first()
        
        expect(result).to(haveCount(1))
        expect(result).to(equal(ExpectedResults.oneCityResult))
    }

    func testUpdateCitiesByNameLike() throws {
        let result = try repository.updateCitiesByNameLike(page: 0, searchString: "daha")
            .toBlocking()
            .first()!
        
        expect(result).to(equal(ExpectedResults.pageableListResult))
    }
    
    func testUpdateCitiesByPage() throws {
        let result = try repository.updateCitiesByPage(page: 1)
            .toBlocking()
            .first()!

        expect(result).to(equal(ExpectedResults.pageableListPerPageResult))
    }
}
