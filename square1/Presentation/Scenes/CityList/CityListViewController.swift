//
//  CityListViewController.swift
//  square1
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class CityListViewController: UIViewController, UITableViewDelegate {
    var viewModel: CityListViewModel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let disposeBag = DisposeBag()
    let cellHeight: CGFloat = 108.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentOffset = CGPoint(x: 0.0, y: 44.0)
        registerReusableCell()
        bindViewModel()
    }
    
    private func registerReusableCell(){
        self.tableView.register(
            UINib(nibName: "CityTableViewCell", bundle: nil),
            forCellReuseIdentifier: "cityCell")
    }
    
    private func bindViewModel(){
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let paginationTrigger = tableView.rx.contentOffset
            .asDriver()
            .filter { point in
                point.y + self.tableView.frame.size.height + (3 * self.cellHeight) > self.tableView.contentSize.height
            }
        
        let searchTrigger = searchBar.rx.text
            .orEmpty
            .asDriver()
            .throttle(0.3)
        
        let output = viewModel
            .transform(input: CityListViewModel.Input(
                initTriger: viewWillAppear,
                loadNextPageTrigger: paginationTrigger,
                search: searchTrigger))
        
        output.cities
            .startWith([])
            .asObservable()
            .bind(to: self.tableView.rx.items) { (tableView, row, element) in
                let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell") as! CityTableViewCell
                cell.bindData(city: element)
                return cell
            }.disposed(by: disposeBag)
        
        output.pagination
            .drive()
            .disposed(by: disposeBag)
        
        output.errorTracker
            .drive(onNext: {
                self.showAlertMessage(titleStr: "Error", messageStr: String(describing: $0))
            })
            .disposed(by: disposeBag)
        
        tableView.rx.contentOffset
            .subscribe { _ in
                if self.searchBar.isFirstResponder {
                    _ = self.searchBar.resignFirstResponder()
                }
            }
            .disposed(by: disposeBag)
    }
    
    
}
