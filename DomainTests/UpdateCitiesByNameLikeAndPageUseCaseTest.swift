//
//  UpdateCitiesByNameLikeAndPageUseCaseTest.swift
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

class UpdateCitiesByNameLikeAndPageUseCaseTest: XCTestCase {
    var useCase: UpdateCitiesByNameLikeAndPageUseCase!
    var repository: CityRepositoryMock!
    
    override func setUp() {
        super.setUp()
        repository = CityRepositoryMock()
        useCase = UpdateCitiesByNameLikeAndPageUseCase(repository: repository,
                                          scheduler: MainScheduler.instance)
    }
    
    func testShouldRetrievePaginatedResult() throws {
        let result = try? useCase.execute(page: 1, searchString: "har").toBlocking().first()
        
        expect(result??.currentPage).to(equal(0))
        expect(result??.items).to(haveCount(1))
        expect(self.repository.storeCitiesWasCalled).to(equal(true))
    }
}
