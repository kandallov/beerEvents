//
//  EventInfoThreeLabelModel.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/14/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class EventInfoThreeLabelModel: BaseElementModel {
    override var cellClass: UITableViewCell.Type { return BaseContainerTableViewCell<ThreeLabelView>.self }
    
    var beerEvent: BeerEvents
    
    init(_ beerEvent: BeerEvents) {
        self.beerEvent = beerEvent
    }
    
    override func genericConfigureCell<T: BaseContainerTableViewCell<ThreeLabelView>>(_ cell: T) {
        cell.backgroundColor = .clear
        cell.mViewContent.firstLabel.numberOfLines = 0
        cell.mViewContent.firstLabel.textAlignment = .center
        cell.mViewContent.firstLabel.text = beerEvent.name
        cell.mViewContent.secondLabel.numberOfLines = 0
        cell.mViewContent.secondLabel.textAlignment = .center
        cell.mViewContent.secondLabel.text = beerEvent.region + ", " + beerEvent.countryIsoCode
        cell.mViewContent.thirdLabel.numberOfLines = 0
        cell.mViewContent.thirdLabel.textAlignment = .center
        cell.mViewContent.thirdLabel.text = beerEvent.endDate
    }
}
