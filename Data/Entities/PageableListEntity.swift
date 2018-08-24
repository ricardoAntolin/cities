//
//  PageableList.swift
//  Data
//
//  Created by Ricardo Antolin on 22/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

public struct PageableListEntity<T> {
    let items: [T]
    let currentPage: Int
    let lastPage: Int
    let perPage: Int
    let total: Int

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
