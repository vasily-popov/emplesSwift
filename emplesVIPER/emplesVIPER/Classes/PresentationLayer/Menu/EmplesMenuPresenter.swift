//
//  EmplesMenuPresenter
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

class EmplesMenuPresenter :PresenterUICycleProtocol {
    
    public weak var view :EmplesMenuView?
    public var router :EmplesMenuRouter?
    private var model: EmplesMenuModel!
    
    required init(_ model: EmplesMenuModel) {
        self.model = model
        self.model.delegate = self
    }
    
    func viewDidLoad() {
        self.view?.setSource(self.model.dataSource)
    }
}

extension EmplesMenuPresenter :EmplesMenuSelectProtocol {

    func select(_ item: MenuSelectedItem) {
        self.router?.navigate(item: item)
    }
}

