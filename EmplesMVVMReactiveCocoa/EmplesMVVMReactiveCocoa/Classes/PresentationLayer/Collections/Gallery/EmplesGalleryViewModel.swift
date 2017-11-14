//
//  EmplesGalleryController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

class EmplesGalleryViewModel: EmplesCollectionViewModelBase, EmplesCollectionViewModelProtocol {
    
    internal var title: String = "Gallery".uppercased()
    internal lazy var dataSource:Any? = {
        return self.__dataSource
    }()
    internal lazy var delegate:Any? = {
        return self.__delegate
    }()
    
    private lazy var __dataSource:GenericGridViewSource = {
        return GenericGridViewSource()
    }()
    private lazy var __delegate:GenericGridViewDelegate = {
        return GenericGridViewDelegate(with: self.__dataSource)
    }()
    
    override func showPreparedArray(_ area:Array<RecArea>) {
        
        let source = area.map { (item) -> DataGridSourceItem in
            let cellModel = EmplesGridCellModel()
            cellModel.text = item.recAreaName
            cellModel.imageURL = item.imageURL
            return DataGridSourceItem(model: cellModel) { [weak self] (model, index) in
                self?.select(item)
            }
        }
        self.__dataSource.setDataSource(source)
    }
    
}
