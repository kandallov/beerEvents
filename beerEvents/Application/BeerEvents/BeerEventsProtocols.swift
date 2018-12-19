//
//  BeerEventsProtocols.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit
//view
protocol BeerEventsViewInputProtocol: class {
    func dataSourceUpdated()
    func scrollViewDidScroll(_ scrollView: UIScrollView)
}

protocol BeerEventsViewOutputProtocol: class {
    func back()
    func loadEvents()
}
//interactor
protocol BeerEventsInteractorInputProtocol: class {
    func loadEvents()
}

protocol BeerEventsInteractorOutputProtocol: class {
    func eventsLoaded(_ events: [BeerEvents])
}
//builder
protocol BeerEventsObjectsBuilderInputProtocol: class {
    func modelsFromData(_ data: [BeerEvents])
}

protocol BeerEventsObjectsBuilderOutputProtocol: class {
    func modelsConstructed(_ data:[BaseElementModel])
}
//router
protocol BeerEventsRouterInputProtocol: class {
    func back()
    func toBeerEventInfo(_ beerEvents: BeerEvents)
}

protocol BeerEventsRouterOutputProtocol: class {
    
}
//dataSource
protocol BeerEventsDataSourceOutputProtocol: BaseDataSourceOutputProtocol {
    func scrollViewDidScroll(_ scrollView: UIScrollView)
}
//presenter
protocol BeerEventsPresenterProtocol: BeerEventsViewOutputProtocol, BeerEventsInteractorOutputProtocol, BeerEventsObjectsBuilderOutputProtocol, BeerEventsRouterOutputProtocol, BeerEventsDataSourceOutputProtocol {
    
}
