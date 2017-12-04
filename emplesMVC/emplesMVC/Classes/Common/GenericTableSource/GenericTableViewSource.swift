//
//  GenericTableViewSource.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/8/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

protocol GenericTableViewSourceProtocol {

    var elements: [DataSourceItem] {get}
}

class GenericTableViewSource: NSObject, GenericTableViewSourceProtocol {
    var elements: [DataSourceItem] = []
    
    convenience init(with source:[DataSourceItem]?) {
        self.init()
        if let source = source {
            self.elements += source
        }
    }
    
    public func setDataSource(_ dataSource:[DataSourceItem]) {
         self.elements = Array(dataSource)
    }
    
    public func appendItems(_ items:[DataSourceItem]) {
        self.elements += items
    }
    
    
}
extension GenericTableViewSource:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.elements[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.model.cellClassName, for: indexPath)
        if let cell = cell as? ViewCellProtocol {
            cell.configureModel(item.model)
        }
        return cell
    }
}

