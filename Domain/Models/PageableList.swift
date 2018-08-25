//
//  PageableList.swift
//  Domain
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

public struct PageableList<T> {
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

extension PageableList: Equatable where T: Equatable {
    public static func == (lhs: PageableList<T>, rhs: PageableList<T>) -> Bool {
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
