//
//  BaseVIPERProtocols.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

protocol BaseDataSourceProtocol {
    associatedtype SectionModelProtocol: BaseSectionModelProtocol
    func loadData(data: [SectionModelProtocol])
}

protocol BaseSectionModelProtocol {
    associatedtype ElementsClass: BaseElementModelProtocol
    var elements: [ElementsClass] { get set }
}

protocol BaseElementModelProtocol {
    var cellClass: UITableViewCell.Type { get }
    var onClick: () -> Void { get set }
    func configureCell(_ cell: UITableViewCell)
}
