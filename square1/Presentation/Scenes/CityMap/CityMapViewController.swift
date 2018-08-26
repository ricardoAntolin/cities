//
//  CityMapViewController.swift
//  square1
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import UIKit
import MapKit
import RxSwift
import RxCocoa
import RxMKMapView

class CityMapViewController: UIViewController, MKMapViewDelegate {
    var viewModel: CityMapViewModel!
    let disposeBag = DisposeBag()

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    private func bindViewModel(){
        let output = viewModel
            .transform(input: CityMapViewModel.Input(
                initTriger: mapView.rx.didFinishLoadingMap.asDriver()))
        
        output.cities.drive(mapView.rx.annotations)
        .disposed(by: disposeBag)
        
        mapView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
    }
}
