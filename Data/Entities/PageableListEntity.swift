//
//  PageableList.swift
//  Data
//
//  Created by Ricardo Antolin on 22/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//
import Domain

public struct PageableListEntity<T> {
    public let items: [T]
    public let currentPage: Int
    public let lastPage: Int
    public let perPage: Int
    public let total: Int

    public init(items: [T],
         currentPage: Int,
         lastPage: Int,
         perPage: Int,
         total: Int) {
        self.items = items
        self.currentPage = currentPage
        self.lastPage = lastPage
        self.perPage = perPage
        self.total = total
    }
}

extension PageableListEntity: DomainConvertibleType where T: DomainConvertibleType {
    public typealias DomainType = PageableList<T.DomainType>
    
    public func asDomainModel() -> PageableList<T.DomainType> {
        return PageableList(
                items: items.map{ $0.asDomainModel() },
                currentPage: currentPage,
                lastPage: lastPage,
                perPage: perPage,
                total: total)
    }
}

extension PageableList: DataConvertibleType where T: DataConvertibleType {
    public typealias DataType = PageableListEntity<T.DataType>
    
    public func asDataEntity() -> PageableListEntity<T.DataType> {
        return PageableListEntity(
                items: items.map{ $0.asDataEntity() },
                currentPage: currentPage,
                lastPage: lastPage,
                perPage: perPage,
                total: total)
    }
}

extension PageableListEntity: Equatable where T: Equatable {
    public static func == (lhs: PageableListEntity<T>, rhs: PageableListEntity<T>) -> Bool {
        guard lhs.items.count == rhs.items.count else {
            return false
        }
        
        return lhs.items == rhs.items &&
            lhs.currentPage == rhs.currentPage &&
            lhs.lastPage == rhs.lastPage &&
            lhs.perPage == rhs.perPage &&
            lhs.total == rhs.total
        
    }
}
