//
//  RMCountry.swift
//  RealmDataProvider
//
//  Created by Ricardo Antolin on 22/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import Realm
import RealmSwift
import Data

final class RMCountry: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var code: String = ""
    @objc dynamic var createdAt: Date = Date()
    @objc dynamic var updatedAt: Date = Date()
    @objc dynamic var continentId: Int = 0

    struct Keys {
        static let id = "id"
        static let name = "name"
        static let code = "code"
        static let createdAt = "created_at"
        static let updatedAt = "updated_at"
        static let continentId = "continent_id"
    }
}

extension RMCountry: DataConvertibleType {
    func asDataEntity() -> CountryEntity {
        return CountryEntity(
            id: id,
            name: name,
            code: code,
            createdAt: createdAt,
            updatedAt: updatedAt,
            continentId: continentId)
    }
}

extension CountryEntity: RealmRepresentable {
    func asRealm() -> RMCountry {
        return RMCountry.build({ object in
            object.id = id
            object.name = name
            object.code = code
            object.createdAt = createdAt
            object.updatedAt = updatedAt
            object.continentId = continentId ?? 0
        })
    }
}
