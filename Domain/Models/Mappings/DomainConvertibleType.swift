//
//  DomainConvertibleType.swift
//  Domain
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

public protocol DomainConvertibleType {
    associatedtype DomainType
    
    func asDomainModel() -> DomainType
}
