//
//  UIConvertibleType.swift
//  square1
//
//  Created by Ricardo Antolin on 26/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

public protocol UIConvertibleType {
    associatedtype UIType
    
    func asUIModel() -> UIType
}
