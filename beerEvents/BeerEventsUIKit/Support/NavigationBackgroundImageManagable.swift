//
//  NavigationBackgroundImageManagable.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/6/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

public protocol NavigationBackgroundImageManagable: class {
    var backgroundImageBuffer: UIImage? { get set }
    func hideBackgroundImage()
    func showBackgroundImage()
}

public extension NavigationBackgroundImageManagable where Self: UIViewController {
    func hideBackgroundImage() {
        backgroundImageBuffer = self.navigationController?.navigationBar.backgroundImage(for: .default)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func showBackgroundImage() {
        self.navigationController?.navigationBar.setBackgroundImage(backgroundImageBuffer, for: .default)
    }
}
