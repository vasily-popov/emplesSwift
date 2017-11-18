//
//  EmplesStackedPresenter
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import RxSwift

protocol EmplesStackViewModelProtocol {
    var title: String? {get}
    var stackItems: Variable<[DataSourceItem]?> {get}
}

class EmplesStackedViewModel: EmplesStackViewModelProtocol {
    
    // MARK: - Input
    public var router :EmplesItemRouter!
    private var model: DisplayAreaCollectionUseCase!
    
    // MARK: - Outout
    internal let stackItems = Variable<[DataSourceItem]?>(nil)
    internal var title : String? { return "Stack".uppercased() }
    
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
            .bind(to:stackItems)
            .disposed(by: bag)
    }
}

