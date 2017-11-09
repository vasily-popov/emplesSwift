//
//  EmplesMenuController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

class EmplesMenuController {
    
    public weak var view :EmplesMenuView?
    public var router :EmplesMenuRouter?
    private var model: EmplesMenuModel
    
    required init(_ model: EmplesMenuModel) {
        self.model = model
        self.model.delegate = self
    }
}

extension EmplesMenuController :EmplesMenuSelectProtocol {

    func select(_ item: MenuSelectedItem) {
        self.router?.navigate(item: item)
    }
}

