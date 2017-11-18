//
//  EmplesMenuPresenter
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol EmplesMenuViewModelProtocol {
    var title: String? {get}
    var menuItems: Variable<[DataSourceItem]?> {get}
}

class EmplesMenuViewModel :EmplesMenuViewModelProtocol {
    
    // MARK: - Input
    public var router :EmplesMenuRouter!
    private var model: EmplesMenuModel!
    
    // MARK: - Outout
    internal let menuItems = Variable<[DataSourceItem]?>(nil)
    internal var title : String? { return "Menu".uppercased() }
    
    // MARK: - Init
    private let bag = DisposeBag()
    required init(_ model: EmplesMenuModel) {
        self.model = model
        self.bindOutput()
    }
    
    func bindOutput() {
        
        Observable<String>.from(model.source)
            .map { text -> DataSourceItem in
                let item = EmplesMenuCellViewModel()
                item.text = text
                return DataSourceItem(model: item, rowHeight: 50.0, { (model, index) in
                    if let screen = MenuScreen(rawValue: index) {
                        self.router.navigate(item: screen)
                    }
                })
            }.reduce([DataSourceItem](), accumulator: { (accumulation: [DataSourceItem], model) -> [DataSourceItem] in
                return accumulation + [model]
            }).bind(to: menuItems)
            .disposed(by: bag)
    }
    deinit {
    }
}

