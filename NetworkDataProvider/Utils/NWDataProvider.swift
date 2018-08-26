//
//  NWDataProvider.swift
//  NetworkDataProvider
//
//  Created by Ricardo Antolin on 22/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxAlamofire
import RxSwift
import RxCodable

final class NWDataProvider<T: Codable> {
    
    private let baseURL: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init(_ baseURL: String) {
        self.baseURL = baseURL
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func getItems(_ path: String, parameters: [String: Any]? = nil) -> Single<[T]> {
        let absolutePath = "\(baseURL)\(path)"
        return RxAlamofire
            .data(.get, absolutePath, parameters: parameters)
            .debug()
            .map([T].self)
            .asSingle()
            .observeOn(scheduler)
    }
    
    func getItem(_ path: String, parameters: [String: Any]? = nil) -> Single<T> {
        let absolutePath = "\(baseURL)\(path)"
        let url = NSURL(string: absolutePath)?.absoluteString
        
        return RxAlamofire
            .data(.get, absolutePath, parameters: parameters)
            .debug()
            .map(T.self)
            .asSingle()
            .observeOn(scheduler)
        
    }
    
    func postItem(_ path: String, parameters: [String: Any]? = nil) -> Single<T> {
        let absolutePath = "\(baseURL)\(path)"
        return RxAlamofire
            .data(.post, absolutePath, parameters: parameters)
            .debug()
            .map(T.self)
            .asSingle()
            .observeOn(scheduler)
    }
    
    func updateItem(_ path: String, parameters: [String: Any]? = nil) -> Single<T> {
        let absolutePath = "\(baseURL)\(path)"
        return RxAlamofire
            .data(.put, absolutePath, parameters: parameters)
            .debug()
            .map(T.self)
            .asSingle()
            .observeOn(scheduler)
    }
    
    func deleteItem(_ path: String, parameters: [String: Any]? = nil) -> Single<T> {
        let absolutePath = "\(baseURL)\(path)"
        return RxAlamofire
            .data(.delete, absolutePath, parameters: parameters)
            .debug()
            .map(T.self)
            .asSingle()
            .observeOn(scheduler)
    }
}
