//
//  DetailPresenter
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation
import RxSwift

class DetailViewModel {
    
    
    // MARK: - Input
    private var model: DetailAreaModel!
    
    // MARK: - Outout
    let listItems = Variable<[DataSourceItem]?>(nil)
    lazy var title:String? = {
        return self.model.titleName?.uppercased()
    }()
    
    // MARK: - Init
    private let bag = DisposeBag()
    required init(_ model: DetailAreaModel) {
        self.model = model
        self.bindOutput()
    }
    
    func bindOutput() {
        
        model.dataSource.asObservable().bind(to: listItems).disposed(by: bag)
        /*
        Observable.of(model.dataSource)
            .bind(to: listItems)
            .disposed(by: bag)
 */
    }
}
