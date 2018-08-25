//
//  UpdateCitiesPageUseCase.swift
//  DomainTests
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift
import RxBlocking
import Nimble
import XCTest
@testable import Domain

class UpdateCitiesPageUseCaseTest: XCTestCase {
    var useCase: UpdateCitiesPageUseCase!
    var repository: CityRepositoryMock!
    
    override func setUp() {
        super.setUp()
        repository = CityRepositoryMock()
        useCase = UpdateCitiesPageUseCase(repository: repository,
                                scheduler: MainScheduler.instance)
    }
    
    func testShouldRetrievePaginatedResult() throws {
        let result = try? useCase.execute(page: 1).toBlocking().first()
        
        expect(result??.currentPage).to(equal(1))
        expect(result??.items).to(haveCount(2))
        expect(self.repository.storeCitiesWasCalled).to(equal(true))
    }
}

