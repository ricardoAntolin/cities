//
//  ViewModelType.swift
//  Wunder
//
//  Created by Ricardo Antolin on 4/3/18.
//  Copyright © 2018 Wunder. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
