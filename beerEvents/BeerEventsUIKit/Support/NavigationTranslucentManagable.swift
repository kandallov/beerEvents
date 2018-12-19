//
//  NavigationTranslucentManagable.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/6/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

public protocol NavigationTranslucentManagable: class {
    var isTranslucent: Bool? { get set }
    func setTranslucent()
    func restoreTranslucent()
}

public extension NavigationTranslucentManagable where Self: UIViewController {
    func setTranslucent() {
        isTranslucent = self.navigationController?.navigationBar.isTranslucent
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func restoreTranslucent() {
        self.navigationController?.navigationBar.isTranslucent = isTranslucent ?? false
    }
}
