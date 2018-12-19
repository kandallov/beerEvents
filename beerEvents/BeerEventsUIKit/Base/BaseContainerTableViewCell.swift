//
//  BaseContainerTableViewCell.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/3/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit
import SnapKit

public class BaseContainerTableViewCell<ContentView: UIView>: UITableViewCell {
    
    public lazy var mViewContent: ContentView = {
        let view = ContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubviews()
        makeConstraints()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(mViewContent)
    }
    
    func makeConstraints() {
        mViewContent.snp.makeConstraints { make -> Void in
            make.edges.equalToSuperview()
        }
    }
}

