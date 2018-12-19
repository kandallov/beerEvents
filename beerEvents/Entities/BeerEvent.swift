//
//  BeerEvent.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/5/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

struct Brewerydb: Decodable {
    var currentPage: Int
    var data: [BeerEvents]
}

struct BeerEvents: Decodable {
    var name: String
    var countryIsoCode: String
    var region: String
    var endDate: String
    var description: String?
    var price: String?
    var country: Country?
    var images: Images?
    
}

struct Country: Decodable {
    var name: String
    var displayName: String
    var isoCode: String
}

struct Images: Decodable {
    var icon: String
    var large: String
    var medium: String
}
