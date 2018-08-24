//
//  RealmDataRepository.swift
//  RealmDataProvider
//
//  Created by Ricardo Antolin on 22/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RealmSwift
import Realm
import RxSwift
import Data

public class RealmDataRepository: LocalDataStore {
    private let cityRealmRepository: CityRealmDataRepository
    
    public init(scheduler: ImmediateSchedulerType) {
        let dbFilePAth = RLMRealmPathForFile("square1.realm")
        let configuration = Realm.Configuration(
            fileURL: URL(fileURLWithPath: dbFilePAth, isDirectory: false),
            deleteRealmIfMigrationNeeded: true)
        self.cityRealmRepository =
            CityRealmDataRepository(realm: try! Realm(configuration: configuration), scheduler: scheduler)
        print("File 📁 url: \(dbFilePAth)")
    }

    public func storeCities(_ cities: [CityEntity]) -> Completable {
        return cityRealmRepository
            .storeCities(cities.map{ $0.asRealm() })
    }
    
    public func findAllCities() -> Observable<[CityEntity]>{
        return cityRealmRepository
            .findAllCities()
            .map({ $0.map{ $0.asDataEntity() } })
    }
    
    public func findCitiesByNameLike(_ searchString: String) -> Observable<[CityEntity]> {
        return cityRealmRepository
            .findCitiesByNameLike(searchString)
            .map({ $0.map{ $0.asDataEntity() } })
    }
}
