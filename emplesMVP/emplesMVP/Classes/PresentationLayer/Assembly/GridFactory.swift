//
//  GridFactory.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import FieryCrucible

class GridFactory : DependencyFactory {
    
    weak var collection: CollectionFactory!
    
    required init(_ factory:CollectionFactory) {
        self.collection = factory
        super.init()
    }
    
    public func view() -> CollectionViewProtocol {
        return scoped(EmplesGridView()) { view in
            view.presenter = self.presenter()
        }
    }
    
    func presenter() -> EmplesGridPresenter {
        return scoped(EmplesGridPresenter(collection.model())) { presenter in
            presenter.view = self.view()
            presenter.router = self.collection.router()
        }
    }
}
