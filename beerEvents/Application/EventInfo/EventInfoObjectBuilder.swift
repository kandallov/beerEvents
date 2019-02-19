//
//  EventInfoObjectBuilder.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/12/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import Foundation

class EventInfoObjectsBuilder: EventInfoObjectsBuilderInputProtocol {
    
    weak var presenter: EventInfoObjectsBuilderOutputProtocol!
    
    func modelsFromData(_ data: BeerEvents) {
        var models = [BaseElementModel]()
        models.append(EventInfoLinedImageViewModel(data))
        models.append(EventInfoThreeLabelModel(data))
        if let price = data.price {
          models.append(EventInfoSingleLabelModel(price))
        }
        if let description = data.descriptions {
           models.append(EventInfoSingleLabelModel(description))
        }
        models.append(EventInfoLinedImageViewModel(data))
        models.append(EventInfoEmptyCellModel())
        models.append(EventInfoEmptyCellModel())
        
        presenter.modelsConstructed(models)
    }
}
