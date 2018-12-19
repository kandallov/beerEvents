//
//  BeerEventsPresenter.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class BeerEventsPresenter: BeerEventsPresenterProtocol {
    
    weak var view: BeerEventsViewInputProtocol!
    var interactor: BeerEventsInteractorInputProtocol!
    var objectsBuilder: BeerEventsObjectsBuilderInputProtocol!
    var dataSource: BaseDataSourceInputProtocol!
    var router: BeerEventsRouterInputProtocol!
    
    func modelSelected(_ model: BaseElementModel) {
        if let beerEventCell = model as? BeerEventsThreeLabelModel {
            router.toBeerEventInfo(beerEventCell.beerEvent)
        }
    }
    
    func dataSourceUpdated() {
        view.dataSourceUpdated()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.scrollViewDidScroll(scrollView)
    }
    
    func loadEvents() {
        interactor.loadEvents()
    }
    
    func eventsLoaded(_ events: [BeerEvents]) {
        objectsBuilder.modelsFromData(events)
    }
    
    func modelsConstructed(_ data: [BaseElementModel]) {
        dataSource.loadData(data: [BaseSectionModel(elements: data)])
    }
    
    func back() {
        router.back()
    }
    
}
