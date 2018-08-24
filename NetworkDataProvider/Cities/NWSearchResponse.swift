//
//  NWSearchResponse.swift
//  NetworkDataProvider
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//
import Data

struct NWSearchResponse: Codable, Equatable, DataConvertibleType{
    let data: NWData
    let time: Int64

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case time = "time"
    }

    init(data: NWData,
         time: Int64) {
        self.data = data
        self.time = time
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decode(NWData.self, forKey: .data)
        time = try values.decode(Int64.self, forKey: .time)
    }
    
    func asDataEntity() -> PageableListEntity<CityEntity> {
        return PageableListEntity(
            items: data.items.map({ $0.asDataEntity() }),
            currentPage: data.pagination?.currentPage ?? 0,
            lastPage: data.pagination?.lastPage ?? 0,
            perPage: data.pagination?.perPage ?? 0,
            total: data.pagination?.total ?? 0)
    }
}


struct NWData: Codable, Equatable {
    let items: [NWCity]
    let pagination: NWPagination?
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
        case pagination = "pagination"
    }
    
    init(items: [NWCity],
         pagination: NWPagination?) {
        self.items = items
        self.pagination = pagination
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        items = try values.decodeIfPresent([NWCity].self, forKey: .items) ?? []
        pagination = try values.decodeIfPresent(NWPagination.self, forKey: .pagination)
    }
}
