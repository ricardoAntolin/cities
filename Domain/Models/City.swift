//
//  City.swift
//  Domain
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

public struct City: Equatable {
    public let id: Int
    public let name: String
    public let lat: Double
    public let lng: Double
    public let createdAt: Date
    public let updatedAt: Date
    public let countryId: Int?
    public let country: Country?

    public init(id: Int,
                name: String,
                lat: Double,
                lng: Double,
                createdAt: Date,
                updatedAt: Date,
                countryId: Int?,
                country: Country?) {
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
