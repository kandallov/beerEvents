//
//  EventInfoRouter.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/12/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class EventInfoRouter: EventInfoRouterInputProtocol {
    
    weak var localRouter: EventInfoRouter?
    
    weak var presenter: EventInfoRouterOutputProtocol!
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
    
}
