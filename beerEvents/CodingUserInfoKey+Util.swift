//
//  CodingUserInfoKey+Util.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 2/18/19.
//  Copyright © 2019 Aleksandr Kandalov. All rights reserved.
//

import Foundation

public extension CodingUserInfoKey {
    // Helper property to retrieve the Core Data managed object context
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}
