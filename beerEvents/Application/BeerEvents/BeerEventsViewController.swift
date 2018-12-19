//
//  BeerEventsViewController.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class BeerEventsViewController: UIViewController, BeerEventsViewInputProtocol, NavigationBackgroundImageManagable, NavigationShadowManagable, NavigationTranslucentManagable {
    
    var presenter: BeerEventsViewOutputProtocol!
    var imageShadowBuffer: UIImage?
    var backgroundImageBuffer: UIImage?
    var isTranslucent: Bool?
    
    weak var dataSource: (UITableViewDelegate & UITableViewDataSource)?
    
    var tableContentOffset: CGFloat {
        return Sizes.large.value + view.navigationBarHeight
    }
    
    lazy var tableView = { () -> UITableView in
        let table = UITableView()
        table.backgroundColor = .clear
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 60
        table.separatorStyle = .none
        table.contentInset = UIEdgeInsets(top: tableContentOffset, left: 0.0, bottom: tableContentOffset, right: 0.0)
        table.clipsToBounds = false
        table.alwaysBounceVertical = false
        return table
    }()
    
    var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "beerMugs")
        return imageView
    }()
    
    var blackBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadEvents()
        view.backgroundColor = .black
        addSubviews()
        makeConstraints()
        configureSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideBackgroundImage()
        hideShadow()
        setTranslucent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        showBackgroundImage()
        showShadow()
        restoreTranslucent()
        super.viewWillDisappear(animated)
    }
    
    private func addSubviews() {
        addSubview(backgroundImageView)
        addSubview(tableView)
        addSubview(blackBarView)
    }
    
    private func makeConstraints() {
        
    }
    
    private func configureSubviews() {
        configureNavigationBar()
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }
    
    func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = .lightGray
    }
    
    func dataSourceUpdated() {
        tableView.reloadData()
    }
    
    @objc func back() {
        presenter.back()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            blackBarView.isHidden = false
        } else {
            blackBarView.isHidden = true
        }
        
        let offset = scrollView.contentOffset.y + tableContentOffset
        let imageAlpha = 1 - (offset / tableContentOffset)
        if 0.0...1.0 ~= imageAlpha {
            backgroundImageView.alpha = imageAlpha
        } else if imageAlpha < 0.0 {
            backgroundImageView.alpha = 0.0
        } else if imageAlpha > 1.0 {
            backgroundImageView.alpha = 1.0
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        backgroundImageView.frame = CGRect(x: 0, y: view.statusbarHeight, width: 200, height: 150)
        backgroundImageView.center.x = view.center.x
        tableView.frame = CGRect(x: 0, y: self.view.safeAreaInsets.top, width: view.frame.width, height: view.frame.height - self.view.safeAreaInsets.top)
        if let navigationBarHeight = navigationController?.navigationBar.frame.height {
            let height = UIApplication.shared.statusBarFrame.height + navigationBarHeight
            blackBarView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
