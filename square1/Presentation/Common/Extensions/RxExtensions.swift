//
//  RxExtensions.swift
//  square1
//
//  Created by Ricardo Antolin on 26/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
}

extension ObservableType {
    
    func catchErrorJustComplete() -> Observable<E> {
        return catchError { _ in
            return Observable.empty()
        }
    }
    
    func asDriverOnErrorJustComplete() -> Driver<E> {
        return asDriver { _ in
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
    
    func flatMapCompletable(_ selector: @escaping (E) -> Completable) -> Completable {
        return self
            .asObservable()
            .flatMap { e -> Observable<Never> in
                selector(e).asObservable()
            }
            .asCompletable()
    }

}


