//
//  APIWorker.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/5/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit
import CoreData

final class APIWorker {
    
    static let shared = APIWorker()
    private init() {}
    
    private let apiKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" // you can get it free on - https://www.brewerydb.com/developers/apps
    private let beerEventsUrl = "https://sandbox-api.brewerydb.com/v2/events/"
    
//    func getBeerEvents(_ persistentContainer: NSPersistentContainer, completion: @escaping ([BeerEvents]) -> ()) {
    func getBeerEvents(_ persistentContainer: NSPersistentContainer, completion: @escaping (Bool) -> ()) {
        let params = [("key", apiKey)]
        NetWorker.shared.buildRequest(method: "GET", url: beerEventsUrl, params: params) { data in
            do {
                guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext else {
                    fatalError("Failed to retrieve managed object context")
                }
                let managedObjectContext = persistentContainer.viewContext
                let decoder = JSONDecoder()
                decoder.userInfo[codingUserInfoKeyManagedObjectContext] = managedObjectContext
                _ = try decoder.decode(Brewerydb.self, from: data)
                try managedObjectContext.save()
                DispatchQueue.main.async {
                    completion(true)
                }
//                let beerEvents = try JSONDecoder().decode(Brewerydb.self, from: data)
//                DispatchQueue.main.async {
//                    completion(beerEvents.data)
//                }
            } catch let error {
                print("JSONDecoder Error: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
}
