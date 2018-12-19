//
//  EventInfoLinedImageViewModel.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/12/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class EventInfoLinedImageViewModel: BaseElementModel {
    override var cellClass: UITableViewCell.Type { return BaseContainerTableViewCell<LinedImageView>.self }
    
    var beerEvent: BeerEvents
    
    init(_ beerEvent: BeerEvents) {
        self.beerEvent = beerEvent
    }
    
    override func genericConfigureCell<T: BaseContainerTableViewCell<LinedImageView>>(_ cell: T) {
        cell.backgroundColor = .clear
        cell.mViewContent.lineImageView.image = UIImage(named: "barley")!
    }
}
