//
//  NWPagination.swift
//  NetworkDataProvider
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

struct NWPagination: Codable, Equatable {
    let currentPage: Int
    let lastPage: Int
    let perPage: Int
    let total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case lastPage = "last_page"
        case perPage = "per_page"
        case total = "total"
    }

    init(currentPage: Int,
         lastPage: Int,
         perPage: Int,
         total: Int) {
        self.currentPage = currentPage
        self.lastPage = lastPage
        self.perPage = perPage
        self.total = total
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        currentPage = try values.decode(Int.self, forKey: .currentPage)
        lastPage = try values.decode(Int.self, forKey: .lastPage)
        perPage = try values.decode(Int.self, forKey: .perPage)
        total = try values.decode(Int.self, forKey: .total)
    }
}
