//
//  EmplesCarouselPresenter
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import RxSwift

protocol EmplesCarouselViewModelProtocol {
    var title: String? {get}
    var carouselItems: Variable<[DataSourceItem]?> {get}
}

class EmplesCarouselViewModel: EmplesCarouselViewModelProtocol {
    
    // MARK: - Input
    public var router :CollectionRouter!
    private var model: DisplayAreaCollectionUseCase!
    
    // MARK: - Outout
    internal let carouselItems = Variable<[DataSourceItem]?>(nil)
    internal var title : String? { return "Carousel".uppercased() }
    
    // MARK: - Init
    private let bag = DisposeBag()
    required init(_ model: DisplayAreaCollectionUseCase) {
        self.model = model
        self.bindOutput()
    }
    
    func bindOutput() {
        model.displayAreaCollection().flatMap { objects in
            Observable.from(objects)
            }.map({ (recArea) -> DataSourceItem in
                let model = EmplesListCellViewModel()
                model.text = recArea.recAreaName
                model.phone = recArea.recAreaPhone
                model.imageURL = recArea.imageURL
                return DataSourceItem(model: model) { [weak self] (item, index) in
                    self?.router.showDetail(of: recArea)
                }
            }).toArray()
            .bind(to:carouselItems)
            .disposed(by: bag)
    }
}

