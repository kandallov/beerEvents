//
//  BeerEventsObjectBuilder.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import Foundation

class BeerEventsObjectsBuilder: BeerEventsObjectsBuilderInputProtocol {
    
    weak var presenter: BeerEventsObjectsBuilderOutputProtocol!
    
    func modelsFromData(_ data: [BeerEvents]) {
        var models = [BaseElementModel]()
        for event in data {
            models.append(BeerEventsThreeLabelModel(event))
            models.append(BeerEventsLinedViewModel())
        }
        presenter.modelsConstructed(models)
    }
}
