//
//  SingleLabelView.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/12/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit
import SnapKit

public class SingleLabelView: BaseKitView, AppearanceView {
    
    public struct SingleLabelViewAppearance: Appearance {
        public var accessebilityId = "singleLabelView"
        public var contentInset = Sizes.common.value
        public var titleLabelFont = UIFont(name: "Avenir-Light", size: 15.0)
        public var titleLabelTextColor = UIColor.white
        public var titleLabelNumberOfLines = 0
        public var titleLabelTextAlignment = NSTextAlignment.center
    }
    
    public var titleLabel = UILabel()
    
    public var appearance = SingleLabelViewAppearance() {
        didSet {
            configureSubviews()
            makeConstraints()
        }
    }
    
    override func addSubviews() {
        addSubview(titleLabel)
    }
    
    override func configureSubviews() {
        accessibilityIdentifier = appearance.accessebilityId
        titleLabel.font = appearance.titleLabelFont
        titleLabel.textColor = appearance.titleLabelTextColor
        titleLabel.numberOfLines = appearance.titleLabelNumberOfLines
        titleLabel.textAlignment = appearance.titleLabelTextAlignment
    }
    
    override func makeConstraints() {
        titleLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(appearance.contentInset)
            make.bottom.equalToSuperview().offset(-appearance.contentInset)
            make.left.equalToSuperview().offset(appearance.contentInset)
            make.right.equalToSuperview().offset(-appearance.contentInset)
        }
    }
    
}
