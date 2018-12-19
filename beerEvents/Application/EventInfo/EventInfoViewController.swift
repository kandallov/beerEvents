//
//  EventInfoViewController.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/12/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

class EventInfoViewController: UIViewController, EventInfoViewInputProtocol, NavigationBackgroundImageManagable, NavigationShadowManagable, NavigationTranslucentManagable {
    
    var presenter: EventInfoViewOutputProtocol!
    var imageShadowBuffer: UIImage?
    var backgroundImageBuffer: UIImage?
    var isTranslucent: Bool?
    
    weak var dataSource: (UITableViewDelegate & UITableViewDataSource)?
    
    var navigationOffset: CGFloat {
        return view.navigationBarHeight + view.statusbarHeight
    }
    
    lazy var tableView = { () -> UITableView in
        let table = UITableView()
        table.backgroundColor = .clear
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 60
        table.separatorStyle = .none
        table.clipsToBounds = false
        table.alwaysBounceVertical = false
        return table
    }()
    
    var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "beerLogo")
        return imageView
    }()
    
    var whiteBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getDescription()
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
        addSubview(tableView)
        addSubview(whiteBarView)
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButton")!, style: .plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    func dataSourceUpdated() {
        tableView.reloadData()
    }
    
    @objc func back() {
        presenter.back()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: self.view.safeAreaInsets.top, width: view.frame.width, height: view.frame.height - self.view.safeAreaInsets.top)
        if let navigationBarHeight = navigationController?.navigationBar.frame.height {
            let height = UIApplication.shared.statusBarFrame.height + navigationBarHeight
            whiteBarView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

