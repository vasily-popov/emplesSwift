//
//  EmplesGalleryController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol EmplesGalleryViewModelProtocol {
    var title: String? {get}
    var galleryItems: BehaviorRelay<[DataGridSourceItem]?> {get}
}

class EmplesGalleryViewModel: EmplesGalleryViewModelProtocol {
    
    
    // MARK: - Input
    public var router :CollectionRouter!
    private var model: DisplayAreaCollectionUseCase!
    
    // MARK: - Outout
    internal let galleryItems = BehaviorRelay<[DataGridSourceItem]?>(value: nil)
    internal var title : String? { return "Gallery".uppercased() }
    
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
            .bind(to:galleryItems)
            .disposed(by: bag)
    }
}

