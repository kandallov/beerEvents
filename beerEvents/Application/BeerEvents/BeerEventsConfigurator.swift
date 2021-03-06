//
//  BeerEventsConfigurator.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit
import CoreData

class BeerEventsConfigurator {
    
    weak var localRouter: BeerEventsRouter?
    
    @discardableResult
    func loadModule(from navigationController: UINavigationController, persistentContainer: NSPersistentContainer) -> UIViewController {
        let controller = loadModule(navigationObject: navigationController, persistentContainer: persistentContainer)
        localRouter?.showInNavigationController(controller: navigationController)
        return controller
    }
    
    @discardableResult
    func loadModule(navigationObject: UINavigationController, persistentContainer: NSPersistentContainer) -> UIViewController {
        let controller = BeerEventsViewController()
        let presenter = BeerEventsPresenter()
        let router = BeerEventsRouter()
        let interactor = BeerEventsInteractor()
        let objectsBuilder = BeerEventsObjectsBuilder()
        let dataSource = BeerEventsDataSource()
        
        router.baseController = controller
        localRouter = router
        interactor.presenter = presenter
        interactor.persistentContainer = persistentContainer
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = controller
        presenter.objectsBuilder = objectsBuilder
        objectsBuilder.presenter = presenter
        presenter.dataSource = dataSource
        dataSource.beerEventsPresenter = presenter
        controller.dataSource = dataSource
        controller.presenter = presenter
        return controller
    }
    
}
