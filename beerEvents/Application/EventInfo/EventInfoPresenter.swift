//
//  EventInfoPresenter.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/12/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class EventInfoPresenter: EventInfoPresenterProtocol {
    
    
    weak var view: EventInfoViewInputProtocol!
    var interactor: EventInfoInteractorInputProtocol!
    var objectsBuilder: EventInfoObjectsBuilderInputProtocol!
    var dataSource: BaseDataSourceInputProtocol!
    var router: EventInfoRouterInputProtocol!
    
    var beerEvents: BeerEvents?
    
    func modelSelected(_ model: BaseElementModel) {
        
    }
    
    func dataSourceUpdated() {
        view.dataSourceUpdated()
    }
    
    func getDescription() {
        if let beerEvents = beerEvents {
            objectsBuilder.modelsFromData(beerEvents)
        }
    }
    
    func modelsConstructed(_ data: [BaseElementModel]) {
        dataSource.loadData(data: [BaseSectionModel(elements: data)])
    }
    
    func back() {
        router.back()
    }
    
}

