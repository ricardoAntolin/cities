//
//  CityListViewModel.swift
//  square1
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift
import RxCocoa
import Domain

final class CityListViewModel: ViewModelType {
    let findCitiesUseCase: FindCitiesUseCase
    let updateCitiesByNameLikeAndPageUseCase: UpdateCitiesByNameLikeAndPageUseCase
    
    init(findCitiesUseCase: FindCitiesUseCase,
         updateCitiesByNameLikeAndPageUseCase:  UpdateCitiesByNameLikeAndPageUseCase) {
        self.findCitiesUseCase = findCitiesUseCase
        self.updateCitiesByNameLikeAndPageUseCase = updateCitiesByNameLikeAndPageUseCase
    }
    
    func transform(input: Input) -> Output {
        let errorTracker = ErrorTracker()
        let activityIndicator = ActivityIndicator()
        var currentPage = 0
        var lastPage = 0
        
        let citiesUpdate: (Int, String?) -> Driver<PageableList<City>> = { (page: Int, searchString: String?) -> Driver<PageableList<City>> in
            self.updateCitiesByNameLikeAndPageUseCase.execute(page: page, searchString: searchString)
                .do(onSuccess: {
                    currentPage = $0.currentPage
                    lastPage = $0.lastPage
                })
                .trackError(errorTracker)
                .trackActivity(activityIndicator)
                .asDriver(onErrorJustReturn: PageableList<City>())
        }
        
        let cities = input.initTriger
            .flatMap { input.search }
            .flatMap { search in citiesUpdate(0, search).map{ _ in search } }
            .flatMap { search in
                self.findCitiesUseCase.execute(search)
                    .map{ $0.map{ $0.asUIModel() } }
                    .trackError(errorTracker)
                    .asDriver(onErrorJustReturn: [])
            }
        
        let pagination = input.loadNextPageTrigger
            .flatMapLatest { _ in input.search }
            .flatMap { search -> Driver<PageableList<City>>in
                if currentPage < lastPage {
                    currentPage += 1
                    return citiesUpdate(currentPage, search)
                }
                return Driver.just(PageableList<City>())
            }
        
        return Output(cities: cities,
                      pagination: pagination,
                      errorTracker: errorTracker.asDriver())
    }
    
}
extension CityListViewModel {
    struct Input {
        let initTriger: Driver<Void>
        let loadNextPageTrigger: Driver<CGPoint>
        let search: Driver<String>
    }
    
    struct Output {
        let cities: Driver<[UICity]>
        let pagination: Driver<PageableList<City>>
        let errorTracker: Driver<Error>
    }
}
