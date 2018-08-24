//
//  RealmRepresentable.swift
//  RealmDataProvider
//
//  Created by Ricardo Antolin on 22/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import Data

protocol RealmRepresentable {
    associatedtype RealmType: DataConvertibleType
    
    func asRealm() -> RealmType
}
