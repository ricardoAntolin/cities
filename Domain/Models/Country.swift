//
//  Country.swift
//  Domain
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

public struct Country: Equatable {
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
