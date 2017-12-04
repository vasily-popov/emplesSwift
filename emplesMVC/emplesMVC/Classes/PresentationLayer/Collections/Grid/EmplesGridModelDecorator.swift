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
    var dataSource : [T] {
        get {
            let __dataSource = self.model.dataSource.map { (item) -> T in
                let cellModel = EmplesGridCellModel()
                cellModel.text = item.recAreaName
                cellModel.imageURL = item.imageURL
                return T(model: cellModel, { [weak self] (model, _) in
                    self?.model.delegate?.select(item)
                })
            }
            return __dataSource
        }
    }
    
    private let model: EmplesAreasModel
    required init(_ model: EmplesAreasModel) {
        self.model = model
    }
}

