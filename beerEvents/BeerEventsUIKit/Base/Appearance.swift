//
//  Appearance.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/3/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

public protocol Appearance {
    var accessebilityId: String { get set }
}

public protocol AppearanceView {
    associatedtype AppearanceType: Appearance
    var appearance: AppearanceType { get set }
}

