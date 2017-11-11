//
//  EmplesGridController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesGridPresenter: EmplesCollectionPresenter {
    
    var decorator:EmplesGridModelDecorator?
    
    required init(_ model: EmplesAreasModel) {
        super.init(model)
        self.decorator = EmplesGridModelDecorator(model)
    }
    
    override func prepareArray() -> Array<Any>? {
        return decorator?.dataSource
    }
}

