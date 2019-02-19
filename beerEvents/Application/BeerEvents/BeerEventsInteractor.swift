//
//  BeerEventsInteractor.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit
import CoreData

class BeerEventsInteractor: BeerEventsInteractorInputProtocol {
    
    weak var presenter: BeerEventsInteractorOutputProtocol!
    var persistentContainer: NSPersistentContainer!
    
    func loadEvents() {
        clearStorage()
//        APIWorker.shared.getBeerEvents(persistentContainer) { [weak self] (beerEvents) in
        APIWorker.shared.getBeerEvents(persistentContainer) { [weak self] (success) in
            guard let self = self else { return }
            if success {
                guard let beerEvents = self.fetchFromStorage() else { return }
                self.presenter.eventsLoaded(beerEvents)
            }
        }
    }
    
    private func clearStorage() {
        let manageObjectContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BeerEvents")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try manageObjectContext.execute(batchDeleteRequest)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func fetchFromStorage() -> [BeerEvents]? {
        let manageObjectContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<BeerEvents>(entityName: "BeerEvents")
        let sortDescription = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescription]
        do {
            let beerEvents = try manageObjectContext.fetch(fetchRequest)
            return beerEvents
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
