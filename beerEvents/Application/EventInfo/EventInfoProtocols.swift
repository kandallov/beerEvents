//
//  EventInfoProtocols.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/12/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit
//view
protocol EventInfoViewInputProtocol: class {
    func dataSourceUpdated()
}

protocol EventInfoViewOutputProtocol: class {
    func back()
    func getDescription()
}
//interactor
protocol EventInfoInteractorInputProtocol: class {

}

protocol EventInfoInteractorOutputProtocol: class {
    
}
//builder
protocol EventInfoObjectsBuilderInputProtocol: class {
    func modelsFromData(_ beerEvent: BeerEvents)
}

protocol EventInfoObjectsBuilderOutputProtocol: class {
    func modelsConstructed(_ data:[BaseElementModel])
}
//router
protocol EventInfoRouterInputProtocol: class {
    func back()
}

protocol EventInfoRouterOutputProtocol: class {
    
}
//dataSource
protocol EventInfoDataSourceOutputProtocol: BaseDataSourceOutputProtocol {
    
}
//presenter
protocol EventInfoPresenterProtocol: EventInfoViewOutputProtocol, EventInfoInteractorOutputProtocol, EventInfoObjectsBuilderOutputProtocol, EventInfoRouterOutputProtocol, EventInfoDataSourceOutputProtocol {
    
}
