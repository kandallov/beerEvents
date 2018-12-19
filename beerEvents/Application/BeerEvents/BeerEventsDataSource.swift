//
//  BeerEventsDataSource.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class BeerEventsDataSource: BaseDataSource {
    
    weak override var presenter: BaseDataSourceOutputProtocol? {
        set { }
        get {
            return beerEventsPresenter
        }
    }
    weak var beerEventsPresenter: BeerEventsDataSourceOutputProtocol!
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        beerEventsPresenter.scrollViewDidScroll(scrollView)
    }
}
