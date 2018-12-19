//
//  BaseKitView.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/3/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

public class BaseKitView: UIView {
    
    func makeConstraints() {
        
    }
    
    func addSubviews() {
        
    }
    
    func configureSubviews() {
        
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureSubviews()
        makeConstraints()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
