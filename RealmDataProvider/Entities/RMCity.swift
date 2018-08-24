//
//  RMCity.swift
//  RealmDataProvider
//
//  Created by Ricardo Antolin on 22/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import Realm
import RealmSwift
import Data

final class RMCity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var lat: Double = 0.0
    @objc dynamic var lng: Double = 0.0
    @objc dynamic var createdAt: Date = Date()
    @objc dynamic var updatedAt: Date = Date()
    @objc dynamic var countryId: Int = 0
    @objc dynamic var country: RMCountry? = nil

    struct Keys {
        static let id = "id"
        static let name = "name"
        static let lat = "lat"
        static let lng = "lng"
        static let createdAt = "created_at"
        static let updatedAt = "updated_at"
        static let countryId = "country_id"
        static let country = "country"
    }
    
    override class func primaryKey() -> String {
        return Keys.id
    }
}

extension RMCity: DataConvertibleType {
    func asDataEntity() -> CityEntity {
        return CityEntity(
                id: id,
                name: name,
                lat: lat,
                lng: lng,
                createdAt: createdAt,
                updatedAt: updatedAt,
                countryId: countryId,
                country: country?.asDataEntity())
    }
}

extension CityEntity: RealmRepresentable {
    func asRealm() -> RMCity {
        return RMCity.build({ object in
            object.id = id
            object.name = name
            object.lat = lat
            object.lng = lng
            object.createdAt = createdAt
            object.updatedAt = updatedAt
            object.countryId = countryId ?? 0
            object.country = country?.asRealm()
        })
    }
}


