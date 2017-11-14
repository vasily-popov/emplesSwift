//
//  EmplesListController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import ReactiveSwift

class EmplesListViewModel: EmplesCollectionViewModelBase, EmplesCollectionViewModelProtocol {

    internal var title: String = "List".uppercased()
    internal lazy var dataSource:Any? = {
        return self.__dataSource
    }()
    internal lazy var delegate:Any? = {
        return self.__delegate
    }()
    
    private lazy var __dataSource:GenericTableViewSource = {
        return GenericTableViewSource()
    }()
    private lazy var __delegate:GenericTableViewDelegate = {
        return GenericTableViewDelegate(with: self.__dataSource)
    }()
    
    override func showPreparedArray(_ area:Array<RecArea>) {
        
        let source = area.map { (item) -> DataSourceItem in
            let cellModel = EmplesListCellModel()
            cellModel.text = item.recAreaName
            cellModel.phone = item.recAreaPhone
            cellModel.imageURL = item.imageURL
            return DataSourceItem(model: cellModel, rowHeight: 50.0) { [weak self] (model, index) in
                self?.select(item)
            }
        }
        self.__dataSource.setDataSource(source)
    }
}
