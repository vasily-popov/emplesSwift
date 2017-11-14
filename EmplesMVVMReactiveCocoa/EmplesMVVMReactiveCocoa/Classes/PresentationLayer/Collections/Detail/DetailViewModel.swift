//
//  DetailPresenter
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation
import ReactiveSwift

class DetailViewModel {
    
    var loadItemsAction: Signal<Bool, NSError>
    private var loadItemsActionObserver: Signal<Bool, NSError>.Observer
    private let model: DetailAreaModel
    lazy var dataSource:GenericTableViewSource = {
        return GenericTableViewSource()
    }()
    lazy var delegate:GenericTableViewDelegate = {
        return GenericTableViewDelegate(with: self.dataSource)
    }()
    
    lazy var title:String? = {
        return self.model.titleName?.uppercased()
    }()
    
    func viewDidLoad() {
        self.dataSource.setDataSource(model.dataSource)
        self.loadItemsActionObserver.send(value: true)
    }
    
    required init(_ model:DetailAreaModel) {
        self.model = model
        (loadItemsAction, loadItemsActionObserver) = Signal<Bool, NSError>.pipe()
    }
}
