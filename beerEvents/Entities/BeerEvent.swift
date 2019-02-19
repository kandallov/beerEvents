//
//  BeerEvent.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/5/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit
import Foundation
import CoreData

struct Brewerydb: Decodable {
    var currentPage: Int
    var data: [BeerEvents]
}

class BeerEvents: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case countryIsoCode
        case region
        case endDate
        case description
        case price
    }
    
    @NSManaged var name: String?
    @NSManaged var countryIsoCode: String?
    @NSManaged var region: String?
    @NSManaged var endDate: String?
    @NSManaged var descriptions: String?
    @NSManaged var price: String?
    
    //Decodable
    required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "BeerEvents", in: managedObjectContext) else {
                fatalError("Failed to decode BeerEvents")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.countryIsoCode = try container.decodeIfPresent(String.self, forKey: .countryIsoCode)
        self.region = try container.decodeIfPresent(String.self, forKey: .region)
        self.endDate = try container.decodeIfPresent(String.self, forKey: .endDate)
        self.descriptions = try container.decodeIfPresent(String.self, forKey: .description)
        self.price = try container.decodeIfPresent(String.self, forKey: .price)
    }
    
    //Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(countryIsoCode, forKey: .countryIsoCode)
        try container.encode(region, forKey: .region)
        try container.encode(endDate, forKey: .endDate)
        try container.encode(descriptions, forKey: .description)
        try container.encode(price, forKey: .price)
    }
    
}
