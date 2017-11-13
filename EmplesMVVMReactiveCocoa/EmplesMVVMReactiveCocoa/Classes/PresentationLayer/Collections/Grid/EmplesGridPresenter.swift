//
//  EmplesGridController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesGridPresenter: EmplesCollectionPresenter {
    
    override func prepareArray(_ area:Array<RecArea>) -> Array<Any>? {
        let source = area.map { (item) -> DataGridSourceItem in
            let cellModel = EmplesGridCellModel()
            cellModel.text = item.recAreaName
            cellModel.imageURL = item.imageURL
            return DataGridSourceItem(model: cellModel) { [weak self] (model, index) in
                self?.select(item)
            }
        }
        return source
    }
}

