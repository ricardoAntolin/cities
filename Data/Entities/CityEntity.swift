//
//  CityEntity.swift
//  Data
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import Domain

public struct CityEntity: Equatable {
    public let id: Int
    public let name: String
    public let lat: Double
    public let lng: Double
    public let createdAt: Date
    public let updatedAt: Date
    public let countryId: Int?
    public let country: CountryEntity?

    public init(id: Int,
                name: String,
                lat: Double,
                lng: Double,
                createdAt: Date,
                updatedAt: Date,
                countryId: Int?,
                country: CountryEntity?) {
        self.id = id
        self.name = name
        self.lat = lat
        self.lng = lng
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.countryId = countryId
        self.country = country
    }
}

extension CityEntity: DomainConvertibleType {
    public func asDomainModel() -> City {
        return City(id: id,
                name: name,
                lat: lat,
                lng: lng,
                createdAt: createdAt,
                updatedAt: updatedAt,
                countryId: countryId,
                country: country?.asDomainModel())
    }
}

extension City: DataConvertibleType {
    public func asDataEntity() -> CityEntity {
        return CityEntity(id: id,
                name: name,
                lat: lat,
                lng: lng,
                createdAt: createdAt,
                updatedAt: updatedAt,
                countryId: countryId,
                country: country?.asDataEntity())
    }
}
