//
//  FindCitiesByNameLikeUseCaseTest.swift
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

class FindCitiesByNameLikeUseCaseTest: XCTestCase {
    
    let useCase = FindCitiesUseCase(repository: CityRepositoryMock())
    
    func testShouldRetrieveCityList() {
        let result = try! useCase.execute(searchString: "har").toBlocking().first()
        
        expect(result).to(haveCount(1))
        expect(result).to(equal(ExpectedResults.oneCityResult))
    }
    
}
