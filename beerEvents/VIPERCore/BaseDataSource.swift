//
//  BaseDataSource.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 11/30/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

protocol BaseDataSourceInputProtocol: class, UITableViewDataSource, UITableViewDelegate {
    func loadData(data: [BaseSectionModel])
}

protocol BaseDataSourceOutputProtocol: class {
    func modelSelected(_ model: BaseElementModel)
    func dataSourceUpdated()
}

class BaseDataSource: NSObject, BaseDataSourceInputProtocol {
    
    var data: [BaseSectionModel]?
    weak var presenter: BaseDataSourceOutputProtocol?
    
    func loadData(data: [BaseSectionModel]) {
        self.data = data
        presenter?.dataSourceUpdated()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?[section].elements.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let model = data?[indexPath.section].elements[indexPath.row] {
            let cell = tableView.dequeueReusableCell(withClass: model.cellClass, for: indexPath)
            model.configureCell(cell)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let section = data?[indexPath.section] {
            let object = section.elements[indexPath.row]
            presenter?.modelSelected(object)
        }
    }
    
}

