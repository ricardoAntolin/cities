//
//  Apllication.swift
//  square1
//
//  Created by Ricardo Antolin on 25/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import Realm
import RealmSwift
import RxSwift
import RealmDataProvider

final class Application {
    let baseUrl = "​http://connect-demo.mobile1.io/square1/connect/v1"
    
    let realm: Realm
    let scheduler: ImmediateSchedulerType
    
    init() {
        self.scheduler = RunLoopThreadScheduler(threadName: "realm.loop")
        let dbFilePAth = RLMRealmPathForFile("square1.realm")
        let configuration = Realm.Configuration(
            fileURL: URL(fileURLWithPath: dbFilePAth, isDirectory: false),
            deleteRealmIfMigrationNeeded: true)
        
        print("File 📁 url: \(dbFilePAth)")
        
        self.realm = try! Realm(configuration: configuration)
    }
    
    func configureMainInterface(in window: UIWindow) {
        let repositoryProvider = RepositoryProvider(
            realm: realm,
            baseUrl: baseUrl,
            scheduler: scheduler)
        
        let useCaseProvider = UseCaseProvider(
            repositoryProvider: repositoryProvider,
            scheduler: scheduler)
        
        let listNavigationContoller = UINavigationController()
        listNavigationContoller.tabBarItem = UITabBarItem(title: "List", image: nil, selectedImage: nil)
        
        let cityListNavigator = CityListNavigator(
            navigationController: listNavigationContoller,
            useCaseProvider: useCaseProvider)
        
        let mapNavigationContoller = UINavigationController()
        mapNavigationContoller.tabBarItem = UITabBarItem(title: "Map", image: nil, selectedImage: nil)
        
        let cityMapNavigator = CityMapNavigator(
            navigationController: mapNavigationContoller,
            useCaseProvider: useCaseProvider)
        
        let tabBarController = PortraitTabBarController()
        
        tabBarController.viewControllers = [
            listNavigationContoller,
            mapNavigationContoller
        ]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        cityMapNavigator.goToCityMap()
        cityListNavigator.goToCityList()
    }

}
