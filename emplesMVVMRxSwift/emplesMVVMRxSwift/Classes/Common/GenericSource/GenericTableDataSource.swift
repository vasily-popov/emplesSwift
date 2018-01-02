//
//  MenuDataSource.swift
//  emplesMVVMRxSwift
//
//  Created by Vasily Popov on 11/18/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import RxCocoa

class GenericTableDataSource<Cell: UITableViewCell>: NSObject, UITableViewDataSource
                            where Cell: ConfigurableCell {
    
    let items: BehaviorRelay<[DataSourceItem]?>
    
    init(with source: BehaviorRelay<[DataSourceItem]?>) {
        self.items = source
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueCell(ofType: Cell.self).then { (cell) in
            cell.configure(items.value![indexPath.row].model)
        }
    }
}
