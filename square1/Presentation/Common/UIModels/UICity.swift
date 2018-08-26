//
//  UICity.swift
//  square1
//
//  Created by Ricardo Antolin on 26/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import Domain

public struct UICity: Equatable {
    public var id: Int
    public var name: String
    public var lat: Double
    public var lng: Double
    public var createdAt: Date
    public var updatedAt: Date
    public var countryId: Int?
    public var country: UICountry?

    public init(id: Int,
                name: String,
                lat: Double,
                lng: Double,
                createdAt: Date,
                updatedAt: Date,
                countryId: Int?,
                country: UICountry?) {
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

extension City: UIConvertibleType {
    public func asUIModel() -> UICity {
        return UICity(id: id,
                name: name,
                lat: lat,
                lng: lng,
                createdAt: createdAt,
                updatedAt: updatedAt,
                countryId: countryId,
                country: country?.asUIModel())
    }
}
