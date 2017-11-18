//
//  EmplesGridController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import RxSwift

protocol EmplesGridViewModelProtocol {
    var title: String? {get}
    var collectionItems: Variable<[DataGridSourceItem]?> {get}
}

class EmplesGridViewModel: EmplesGridViewModelProtocol {
    
    
    // MARK: - Input
    public var router :EmplesItemRouter!
    private var model: DisplayAreaCollectionUseCase!
    
    // MARK: - Outout
    internal let collectionItems = Variable<[DataGridSourceItem]?>(nil)
    internal var title : String? { return "Grid".uppercased() }
    
    // MARK: - Init
    private let bag = DisposeBag()
    required init(_ model: DisplayAreaCollectionUseCase) {
        self.model = model
        self.bindOutput()
    }
    
    func bindOutput() {
        model.displayAreaCollection().flatMap { objects in
            Observable.from(objects)
            }.map({ (recArea) -> DataGridSourceItem in
                let model = EmplesGridCellViewModel()
                model.text = recArea.recAreaName
                model.imageURL = recArea.imageURL
                return DataGridSourceItem(model: model) { [weak self] (item, index) in
                    self?.router.showDetail(of: recArea)
                }
            }).toArray()
            .bind(to:collectionItems)
            .disposed(by: bag)
    }
}

