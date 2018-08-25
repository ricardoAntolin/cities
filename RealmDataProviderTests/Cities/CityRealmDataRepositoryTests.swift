//
//  RealmDataProviderTests.swift
//  RealmDataProviderTests
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
import Realm
import RealmSwift
import Nimble
import Data
@testable import RealmDataProvider

class CityRealmRepositoryTests: XCTestCase {
    var cityRealmRepository: CityRealmDataRepository!
    let scheduler = MainScheduler()
    
    private var realm: Realm {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        return try! Realm()
    }

    override func setUp() {
        super.setUp()
        cityRealmRepository = CityRealmDataRepository(realm: realm, scheduler: scheduler)
        try! realm.write {
            realm.add(createTwoCities().map { $0.asRealm() })
        }
    }
    
    override func tearDown() {
        super.tearDown()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func testFindAll() {
        let result = try! cityRealmRepository.findAllCities()
            .toBlocking().first()
        
        expect(result).to(haveCount(2))
    }
    
    func testStoreCities() {
        let storeResult = cityRealmRepository.storeCities(createTwoCities()).toBlocking().materialize()
        
        switch storeResult {
        case .failed(elements: _, error: let error):
            XCTFail(error.localizedDescription)
        default:
            print("Stored ok")
        }
    }
    
    func testFindCitiesByNameLike(){
        let result = try! cityRealmRepository.findCitiesByNameLike("daha")
            .toBlocking().first()
        
        expect(result).to(haveCount(1))
    }
    
    private func createOneCity(id: Int = 0, name: String = "Qandahar") -> CityEntity {
        return CityEntity(
            id: id,
            name: name,
            lat: 34.5166667,
            lng: 69.1833344,
            createdAt: getDate(date: "2018-01-07 17:08:01"),
            updatedAt: getDate(date: "2018-04-12 21:37:25"),
            countryId: 2,
            country: CountryEntity(
                id: 2,
                name: "Afghanistan",
                code: "AFG",
                createdAt: getDate(date: "2018-01-07 17:08:01"),
                updatedAt: getDate(date: "2018-01-07 17:08:01"),
                continentId: 1
            )
        )
    }
    
    private func createTwoCities(ids: [Int] = [0,1], names: [String] = ["Qandahar","Haag"]) -> [CityEntity] {
        return [
            createOneCity(id: ids[0], name: names[0]),
            createOneCity(id: ids[1], name: names[1])
        ]
    }
    
    private func getDate(date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: date) ?? Date()
    }
}
