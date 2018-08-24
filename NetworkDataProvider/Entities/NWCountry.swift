//
//  NWCountry.swift
//  NetworkDataProvider
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import Data

struct NWCountry: Codable, Equatable, DataConvertibleType {
    let id: Int
    let name: String
    let code: String
    let createdAt: Date
    let updatedAt: Date
    let continentId: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case code = "code"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case continentId = "continent_id"
    }

    init(id: Int,
         name: String,
         code: String,
         createdAt: Date,
         updatedAt: Date,
         continentId: Int?) {
        self.id = id
        self.name = name
        self.code = code
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.continentId = continentId
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        code = try values.decode(String.self, forKey: .code)
        createdAt = try Date(dateString: values.decode(String.self, forKey: .createdAt))
        updatedAt = try Date(dateString: values.decode(String.self, forKey: .updatedAt))
        continentId = try values.decodeIfPresent(Int.self, forKey: .continentId)
    }
    
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

