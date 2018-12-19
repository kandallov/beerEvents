//
//  BeerEventsRouter.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class BeerEventsRouter: BeerEventsRouterInputProtocol {
    
    weak var localRouter: BeerEventsRouter?
    
    weak var presenter: BeerEventsRouterOutputProtocol!
    weak var baseController: UIViewController!
    weak var navigationObject: UINavigationController!
    
    func showInNavigationController(controller: UINavigationController) {
        navigationObject = controller
        navigationObject?.pushViewController(baseController, animated: true)
    }
    
    func back() {
        if navigationObject != nil {
            navigationObject?.popViewController(animated: true)
        } else {
            baseController.dismiss(animated: true, completion: nil)
        }
    }
    
    func toBeerEventInfo(_ beerEvents: BeerEvents) {
        EventInfoConfigurator().loadModule(from: navigationObject, with: beerEvents)
    }
    
}
