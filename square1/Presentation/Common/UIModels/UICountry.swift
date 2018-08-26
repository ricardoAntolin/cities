//
//  UICountry.swift
//  square1
//
//  Created by Ricardo Antolin on 26/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//
import Domain

public struct UICountry: Equatable {
    public var id: Int
    public var name: String
    public var code: String
    public var createdAt: Date
    public var updatedAt: Date
    public var continentId: Int?

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

extension Country: UIConvertibleType {
    public func asUIModel() -> UICountry{
        return UICountry(
                id: id,
                name: name,
                code: code,
                createdAt: createdAt,
                updatedAt: updatedAt,
                continentId: continentId)
    }
}

