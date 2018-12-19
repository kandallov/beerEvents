//
//  BaseSectionModel.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class BaseSectionModel: BaseSectionModelProtocol {
    var elements: [BaseElementModel]
    init(elements: [BaseElementModel]) {
        self.elements = elements
    }
}
