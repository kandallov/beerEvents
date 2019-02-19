//
//  BeerEventsThreeLabelModel.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/3/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class BeerEventsThreeLabelModel: BaseElementModel {
    override var cellClass: UITableViewCell.Type { return BaseContainerTableViewCell<ThreeLabelView>.self }
    
    var beerEvent: BeerEvents
    
    init(_ beerEvent: BeerEvents) {
        self.beerEvent = beerEvent
    }
    
    override func genericConfigureCell<T: BaseContainerTableViewCell<ThreeLabelView>>(_ cell: T) {
        cell.backgroundColor = .clear
        cell.mViewContent.firstLabel.text = beerEvent.name
        if let region = beerEvent.region, let countryIsoCode = beerEvent.countryIsoCode {
            cell.mViewContent.secondLabel.text = region + ", " + countryIsoCode
        }
        cell.mViewContent.thirdLabel.text = beerEvent.endDate
    }
}


