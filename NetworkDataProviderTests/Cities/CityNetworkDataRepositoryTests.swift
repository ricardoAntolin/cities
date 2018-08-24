//
//  NetworkDataProviderTests.swift
//  NetworkDataProviderTests
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
import OHHTTPStubs
@testable import NetworkDataProvider

class CityNetworkDataRepositoryTests: XCTestCase {
    let baseURL = "https://www.fakeurl.com/api"
    var repository: CityNetworkDataRepository!
    
    
    override func setUp() {
        super.setUp()
        
        _ = stub(condition: isHost("www.fakeurl.com")) { _ in
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile("response.json", type(of: self)) ?? "",
                statusCode:200,
                headers:["Content-Type":"application/json"])
        }
        
        repository = CityNetworkDataRepository(baseURL: baseURL)
    }
    
    override func tearDown() {
        super.tearDown()
        OHHTTPStubs.removeAllStubs()
    }
    
    
    func testSearchCities() throws {
        let result = try repository.searchCities(includeCountry: true, page: 0, searchString: nil)
            .toBlocking()
            .first()!
        
        XCTAssertEqual(result, ExpectedResults.searchResult)
    }
}

struct ExpectedResults {
    static let searchResult = NWSearchResponse(
        data: NWData(
            items: [NWCity(
                id: 1,
                name: "Kabul",
                lat: 34.5166667,
                lng: 69.1833344,
                createdAt: getDate(date: "2018-01-07 17:08:01"),
                updatedAt: getDate(date: "2018-04-12 21:37:25"),
                countryId: 2,
                country: NWCountry(
                    id: 2,
                    name: "Afghanistan",
                    code: "AFG",
                    createdAt: getDate(date: "2018-01-07 17:08:01"),
                    updatedAt: getDate(date: "2018-01-07 17:08:01"),
                    continentId: 1)
                )],
            pagination: NWPagination(
                currentPage: 1,
                lastPage: 272,
                perPage: 15,
                total: 4079)),
        time: 1534842856)
    
    private static func getDate(date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: date) ?? Date()
    }
    
}





