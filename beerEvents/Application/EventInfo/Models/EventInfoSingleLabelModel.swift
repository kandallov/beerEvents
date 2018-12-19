//
//  EventInfoSingleLabelModel.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/12/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class EventInfoSingleLabelModel: BaseElementModel {
    override var cellClass: UITableViewCell.Type { return BaseContainerTableViewCell<SingleLabelView>.self }
    
    var titleLabel: String
    
    init(_ titleLabel: String) {
        self.titleLabel = titleLabel
    }
    
    override func genericConfigureCell<T: BaseContainerTableViewCell<SingleLabelView>>(_ cell: T) {
        cell.backgroundColor = .clear
        cell.mViewContent.titleLabel.numberOfLines = 0
        cell.mViewContent.titleLabel.textAlignment = .center
        cell.mViewContent.titleLabel.text = titleLabel
    }
}
