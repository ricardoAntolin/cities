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

final class CityRealmDataRepository {
    let realmDataProvider: RMDataProvider<RMCity>
    
    init(realm: Realm, scheduler: ImmediateSchedulerType) {
        self.realmDataProvider = RMDataProvider<RMCity>(realm: realm, scheduler: scheduler)
    }
    
    func storeCities(_ cities: [RMCity]) -> Completable {
        return realmDataProvider
            .save(entity: cities)
    }
    
    func findAllCities() -> Observable<[RMCity]>{
        return realmDataProvider
            .queryAll()
    }
    
    func findCitiesByNameLike(_ searchString: String) -> Observable<[RMCity]> {
        return realmDataProvider
            .query(with: NSPredicate(format: "\(RMCity.Keys.name) CONTAINS %@", searchString))
    }
}
