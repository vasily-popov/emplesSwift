//
//  EmplesMenuModelDecorator.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation


class EmplesMenuModelDecorator : DecoratorModelProtocol {
    var dataSource = Array<DataSourceItem>()
    let model: EmplesMenuModel
    required init(model: EmplesMenuModel) {
        self.model = model
        self.initDataSource()
    }
    
    private func initDataSource() {
        self.model.dataSource.forEach { (text) in
            
            let item = EmplesMenuCellModel()
            item.text = text
            let row = DataSourceItem(model: item, rowHeight: 50.0, { [weak self] (model, index) in
                if let selsectedItem = MenuSelectedItem(rawValue: index) {
                    self?.model.delegate?.select(selsectedItem)
                }
            })
            dataSource.append(row)
        }
    }
}

