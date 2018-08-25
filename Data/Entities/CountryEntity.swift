//
//  CountryEntity.swift
//  Data
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//
import Domain

public struct CountryEntity: Equatable {
    public let id: Int
    public let name: String
    public let code: String
    public let createdAt: Date
    public let updatedAt: Date
    public let continentId: Int?

    public init(id: Int,
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
}

extension CountryEntity: DomainConvertibleType{
    public func asDomainModel() -> Country {
        return Country(
                id: id,
                name: name,
                code: code,
                createdAt: createdAt,
                updatedAt: updatedAt,
                continentId: continentId)
    }
}

extension Country: DataConvertibleType {
    public func asDataEntity() -> CountryEntity{
        return CountryEntity(
                id: id,
                name: name,
                code: code,
                createdAt: createdAt,
                updatedAt: updatedAt,
                continentId: continentId)
    }
}
