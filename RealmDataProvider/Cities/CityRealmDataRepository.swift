//
//  CityRealmRepository.swift
//  RealmDataProvider
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift
import Realm
import RealmSwift
import Data

public final class CityRealmDataRepository: LocalCityDataStore {
    private let realmDataProvider: RMDataProvider<RMCity>
    
    public init(realm: Realm, scheduler: ImmediateSchedulerType) {
        self.realmDataProvider = RMDataProvider<RMCity>(realm: realm, scheduler: scheduler)
    }
    
    public func storeCities(_ cities: [CityEntity]) -> Completable {
        return realmDataProvider
            .save(entity: cities.map{ $0.asRealm() })
    }
    
    public func findAllCities() -> Observable<[CityEntity]>{
        return realmDataProvider
            .queryAll()
            .map({ $0.map{ $0.asDataEntity() } })
    }
    
    public func findCitiesByNameLike(_ searchString: String) -> Observable<[CityEntity]> {
        return realmDataProvider
            .query(with: NSPredicate(format: "\(RMCity.Keys.name) CONTAINS %@", searchString))
            .map({ $0.map{ $0.asDataEntity() } })
    }
}
