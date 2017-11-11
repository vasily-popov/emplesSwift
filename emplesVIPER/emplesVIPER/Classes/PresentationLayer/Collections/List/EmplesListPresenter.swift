//
//  EmplesListController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesListPresenter: EmplesCollectionPresenter {
    
    override func prepareArray(_ area:Array<RecArea>) -> Array<Any>? {
        
        let source = area.map { (item) -> DataSourceItem in
            let cellModel = EmplesListCellModel()
            cellModel.text = item.recAreaName
            cellModel.phone = item.recAreaPhone
            cellModel.imageURL = item.imageURL
            return DataSourceItem(model: cellModel, rowHeight: 50.0) { [weak self] (model, index) in
                self?.select(item)
            }
        }
        return source
    }
}
