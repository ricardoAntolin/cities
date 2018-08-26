//
//  City.swift
//  NetworkDataProvider
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//
import Data

struct NWCity: Codable, Equatable, DataConvertibleType {
    let id: Int
    let name: String
    let lat: Double
    let lng: Double
    let createdAt: Date
    let updatedAt: Date
    let countryId: Int?
    let country: NWCountry?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case lat = "lat"
        case lng = "lng"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case countryId = "country_id"
        case country = "country"
    }

    init(id: Int,
         name: String,
         lat: Double,
         lng: Double,
         createdAt: Date,
         updatedAt: Date,
         countryId: Int?,
         country: NWCountry?) {
        self.id = id
        self.name = name
        self.lat = lat
        self.lng = lng
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.countryId = countryId
        self.country = country
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat) ?? 0.0
        lng = try values.decodeIfPresent(Double.self, forKey: .lng) ?? 0.0
        createdAt = try Date(dateString: values.decode(String.self, forKey: .createdAt))
        updatedAt = try Date(dateString: values.decode(String.self, forKey: .updatedAt))
        countryId = try values.decodeIfPresent(Int.self, forKey: .countryId)
        country = try values.decodeIfPresent(NWCountry.self, forKey: .country)
    }
    
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
