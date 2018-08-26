//
//  CityMapViewModel.swift
//  square1
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import RxSwift
import RxCocoa
import Domain
import MapKit

final class CityMapViewModel: ViewModelType {
    let findCitiesUseCase: FindCitiesUseCase
    
    init(findCitiesUseCase: FindCitiesUseCase) {
        self.findCitiesUseCase = findCitiesUseCase
    }
    
    func transform(input: Input) -> Output {
        let errorTracker = ErrorTracker()
        
        let cities = input.initTriger
            .flatMap { _ in
                self.findCitiesUseCase.execute()
                    .map{ $0.map{ $0.asUIModel().mapToPoi() } }
                    .trackError(errorTracker)
                    .asDriver(onErrorJustReturn: [])
        }
        
        return Output(cities: cities)
    }
}

extension CityMapViewModel {
    struct Input {
        let initTriger: Driver<Void>
    }
    
    struct Output {
        let cities: Driver<[Poi]>
    }
}

extension UICity {
    func mapToPoi() -> Poi {
        return Poi(
            name: name,
            country: country?.name,
            coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng))
    }
}

class Poi: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(name: String, country: String?, coordinate: CLLocationCoordinate2D) {
        self.title = name
        self.subtitle = country
        self.coordinate = coordinate
        
        super.init()
    }
}

