//
//  BeerEventsInteractor.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class BeerEventsInteractor: BeerEventsInteractorInputProtocol {
    
    weak var presenter: BeerEventsInteractorOutputProtocol!
    
    func loadEvents() {
        APIWorker.shared.getBeerEvents { [weak self] (beerEvents) in
            guard let self = self else { return }
            self.presenter.eventsLoaded(beerEvents)
        }
    }
    
}
