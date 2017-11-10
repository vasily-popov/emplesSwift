//
//  GalleryFactory.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import FieryCrucible

class GalleryFactory : DependencyFactory {
    
    weak var collection: CollectionFactory!
    
    required init(_ factory:CollectionFactory) {
        self.collection = factory
        super.init()
    }
    
    public func view() -> EmplesCollectionViewProtocol {
        return scoped(EmplesGalleryView()) { view in
            view.model = self.decorator()
            view.controller = self.controller()
        }
    }
    
    func decorator() -> EmplesGridModelDecorator {
        return scoped(EmplesGridModelDecorator(collection.model()))
    }
    
    func controller() -> EmplesGalleryController {
        return scoped(EmplesGalleryController(collection.model())) { controller in
            controller.view = self.view()
            controller.router = self.collection.router()
        }
    }
}
