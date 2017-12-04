//
//  EmplesListAreasModelDecorator.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesListModelDecorator : DecoratorModelProtocol {
    
    typealias T = DataSourceItem
    var dataSource : [T] {
        get {
            
            let __dataSource = self.model.dataSource.map { (item) -> T in
                let cellModel = EmplesListCellModel()
                cellModel.text = item.recAreaName
                cellModel.phone = item.recAreaPhone
                cellModel.imageURL = item.imageURL
                return T(model: cellModel, rowHeight: 50.0, { [weak self] (model, _) in
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
    
    deinit {
        print("EmplesListModelDecorator deinit")
    }
}
