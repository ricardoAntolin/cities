//
//  ExpectedResults.swift
//  DomainTests
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

@testable import Domain


struct ExpectedResults {
    static var oneCityResult = [
        City(
            id: 0,
            name: "Qandahar",
            lat: 34.5166667,
            lng: 69.1833344,
            createdAt: getDate(date: "2018-01-07 17:08:01"),
            updatedAt: getDate(date: "2018-04-12 21:37:25"),
            countryId: 2,
            country: Country(
                id: 2,
                name: "Afghanistan",
                code: "AFG",
                createdAt: getDate(date: "2018-01-07 17:08:01"),
                updatedAt: getDate(date: "2018-01-07 17:08:01"),
                continentId: 1
            )
        )
    ]
    
    static var twoCitiesResult = [
        City(
            id: 0,
            name: "Qandahar",
            lat: 34.5166667,
            lng: 69.1833344,
            createdAt: getDate(date: "2018-01-07 17:08:01"),
            updatedAt: getDate(date: "2018-04-12 21:37:25"),
            countryId: 2,
            country: Country(
                id: 2,
                name: "Afghanistan",
                code: "AFG",
                createdAt: getDate(date: "2018-01-07 17:08:01"),
                updatedAt: getDate(date: "2018-01-07 17:08:01"),
                continentId: 1
            )
        ),
        City(
            id: 1,
            name: "Haag",
            lat: 34.5166667,
            lng: 69.1833344,
            createdAt: getDate(date: "2018-01-07 17:08:01"),
            updatedAt: getDate(date: "2018-04-12 21:37:25"),
            countryId: 2,
            country: Country(
                id: 2,
                name: "Afghanistan",
                code: "AFG",
                createdAt: getDate(date: "2018-01-07 17:08:01"),
                updatedAt: getDate(date: "2018-01-07 17:08:01"),
                continentId: 1
            )
        )
    ]
    
    static var pageableListResult = PageableList(
        items: oneCityResult,
        currentPage: 0,
        lastPage: 0,
        perPage: 1,
        total: 1)
    
    static var pageableListPerPageResult = PageableList(
        items: twoCitiesResult,
        currentPage: 1,
        lastPage: 1,
        perPage: 15,
        total: 17)
    
    private static func getDate(date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: date) ?? Date()
    }
}
