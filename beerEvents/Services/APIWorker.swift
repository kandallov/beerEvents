//
//  APIWorker.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/5/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

final class APIWorker {
    
    static let shared = APIWorker()
    
    private let apiKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" // you can get it free on - https://www.brewerydb.com/developers/apps
    private let beerEventsUrl = "https://sandbox-api.brewerydb.com/v2/events/"
    
    func getBeerEvents(completion: @escaping ([BeerEvents]) -> ()) {
        let params = [("key", apiKey)]
        NetWorker.shared.buildRequest(method: "GET", url: beerEventsUrl, params: params) { data in
            do {
                let beerEvents = try JSONDecoder().decode(Brewerydb.self, from: data)
                DispatchQueue.main.async {
                    completion(beerEvents.data)
                }
            } catch let error {
                print("JSONDecoder Error: \(error.localizedDescription)")
            }
        }
    }
}
