//
//  EmplesGridModelDecorator.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesGridModelDecorator : DecoratorModelProtocol {
    
    typealias T = DataGridSourceItem
    var dataSource : Array<T> {
        get {
            var __dataSource = Array<T>()
            self.model.dataSource.forEach { (item) in
                
                let cellModel = EmplesGridCellModel()
                cellModel.text = item.recAreaName
                cellModel.imageURL = item.imageURL
                let row = T(model: cellModel, { [weak self] (model, index) in
                    self?.model.delegate?.select(item)
                })
                __dataSource.append(row)
            }
            return __dataSource
        }
    }
    
    
    let model: EmplesAreasModel
    required init(_ model: EmplesAreasModel) {
        self.model = model
    }
}

