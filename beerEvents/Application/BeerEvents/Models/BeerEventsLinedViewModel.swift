//
//  BeerEventsLinedViewModel.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/3/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class BeerEventsLinedViewModel: BaseElementModel {
    override var cellClass: UITableViewCell.Type { return BaseContainerTableViewCell<LinedView>.self }
    override func genericConfigureCell<T: BaseContainerTableViewCell<LinedView>>(_ cell: T) {
        cell.backgroundColor = .clear
        cell.mViewContent.lineView.backgroundColor = .white
    }
}
