//
//  DomainTests.swift
//  DomainTests
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift
import RxBlocking
import Nimble
import XCTest
@testable import Domain

class FindAllCitiesUseCaseTests: XCTestCase {
    let useCase = FindAllCitiesUseCase(repository: CityRepositoryMock())

    func testShouldRetrieveCityList() {
        let result = try! useCase.execute().toBlocking().first()
        
        expect(result).to(haveCount(2))
        expect(result).to(equal(ExpectedResults.twoCitiesResult))
    }
    
}
