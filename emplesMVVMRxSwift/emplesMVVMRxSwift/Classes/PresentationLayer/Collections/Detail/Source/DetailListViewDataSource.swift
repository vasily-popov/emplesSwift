//
//  DetailListViewDataSource.swift
//  emplesMVVMRxSwift
//
//  Created by Vasily Popov on 11/19/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import RxSwift

class DetailListViewDataSource: NSObject, UITableViewDataSource {
    
    let items: Variable<[DataSourceItem]?>
    
    init(with source: Variable<[DataSourceItem]?>) {
        self.items = source
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items.value![indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: item.model.cellClassName, for: indexPath)
        if let cell = cell as? ConfigurableCell {
            cell.configure(item.model)
        }
        return cell
    }
}
