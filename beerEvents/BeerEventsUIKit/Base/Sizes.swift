//
//  Sizes.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/3/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

private let defaultSize: CGFloat = 4

public enum Sizes {
    case small
    case common
    case large
    case pixel
    public var value: CGFloat {
        switch self {
        case .small:
            return defaultSize
        case .common:
            return defaultSize * 4
        case .large:
            return defaultSize * 16
        case .pixel:
            return 1 / UIScreen.main.scale
        }
    }
}
