//
//  EventInfoConfigurator.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/12/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class EventInfoConfigurator {
    
    weak var localRouter: EventInfoRouter?
    
    @discardableResult
    func loadModule(from navigationController: UINavigationController, with beerEvent: BeerEvents) -> UIViewController {
        let controller = loadModule(beerEvent, navigationObject: navigationController)
        localRouter?.showInNavigationController(controller: navigationController)
        return controller
    }
    
    @discardableResult
    func loadModule(_ beerEvent: BeerEvents, navigationObject: UINavigationController) -> UIViewController {
        let controller = EventInfoViewController()
        let presenter = EventInfoPresenter()
        let router = EventInfoRouter()
        let interactor = EventInfoInteractor()
        let objectsBuilder = EventInfoObjectsBuilder()
        let dataSource = BaseDataSource()
        
        router.baseController = controller
        localRouter = router
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = controller
        presenter.objectsBuilder = objectsBuilder
        objectsBuilder.presenter = presenter
        presenter.dataSource = dataSource
        presenter.beerEvents = beerEvent
        controller.dataSource = dataSource
        controller.presenter = presenter
        return controller
    }
    
}

