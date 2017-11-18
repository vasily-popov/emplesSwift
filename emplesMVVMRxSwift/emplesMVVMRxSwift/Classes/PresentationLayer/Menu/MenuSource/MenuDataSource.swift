//
//  MenuDataSource.swift
//  emplesMVVMRxSwift
//
//  Created by Vasily Popov on 11/18/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import RxSwift

class MenuDataSource: NSObject, UITableViewDataSource {
    
    let items: Variable<[DataSourceItem]?>
    
    init(with source: Variable<[DataSourceItem]?>) {
        self.items = source
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueCell(ofType: EmplesMenuViewCell.self).then { cell in
            cell.update(with: items.value![indexPath.row].model)
        }
    }
}
