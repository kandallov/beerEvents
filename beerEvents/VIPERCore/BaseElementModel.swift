//
//  BaseElementModel.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class BaseElementModel: NSObject, BaseElementModelProtocol {
    var cellClass:UITableViewCell.Type { return UITableViewCell.self }
    var onClick: () -> Void = { }
    func configureCell(_ cell: UITableViewCell) {
        self.genericConfigureCell(cell)
    }
    
    func genericConfigureCell<T: UITableViewCell>(_ cell: T) {
        
    }
}
