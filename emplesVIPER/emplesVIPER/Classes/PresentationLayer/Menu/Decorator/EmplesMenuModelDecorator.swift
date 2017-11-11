//
//  EmplesMenuModelDecorator.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation


class EmplesMenuModelDecorator : DecoratorModelProtocol {
    
    typealias T = DataSourceItem
    var dataSource : Array<T> {
        get {
            let __dataSource = self.model.dataSource.map { (text) -> T in
                let item = EmplesMenuCellModel()
                item.text = text
                return T(model: item, rowHeight: 50.0, { [weak self] (model, index) in
                    if let selsectedItem = MenuSelectedItem(rawValue: index) {
                        self?.model.delegate?.select(selsectedItem)
                    }
                })
            }
            return __dataSource
        }
    }
    private let model: EmplesMenuModel
    required init(model: EmplesMenuModel) {
        self.model = model
    }
}

