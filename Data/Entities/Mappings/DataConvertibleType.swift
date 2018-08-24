//
//  DataConvertibleType.swift
//  Data
//
//  Created by Ricardo Antolin on 22/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

public protocol DataConvertibleType {
    associatedtype DataType
    
    func asDataEntity() -> DataType
}
