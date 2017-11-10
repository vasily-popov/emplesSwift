//
//  EmplesListController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesListPresenter: EmplesCollectionPresenter {

    var decorator:EmplesListModelDecorator?
    
    required init(_ model: EmplesAreasModel) {
        super.init(model)
        self.decorator = EmplesListModelDecorator(model)
    }
    
    override func prepareArray() -> Array<Any>? {
        return decorator?.dataSource
    }
    
    deinit {
        print("EmplesListController deinit")
    }
    
    
}
