//
//  NavigationShadowManagable.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/6/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

public protocol NavigationShadowManagable: class {
    var imageShadowBuffer: UIImage? { get set }
    func hideShadow()
    func showShadow()
}

public extension NavigationShadowManagable where Self: UIViewController {
    func hideShadow() {
        imageShadowBuffer = self.navigationController?.navigationBar.shadowImage
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func showShadow() {
        self.navigationController?.navigationBar.shadowImage = imageShadowBuffer
    }
}
