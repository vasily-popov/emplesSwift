//
//  CollectionFactory.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import FieryCrucible

class CollectionFactory : DependencyFactory {
    
    var listFactory: ListFactory!
    var gridFactory: GridFactory!
    var galleryFactory: GalleryFactory!
    var stackFactory: StackFactory!
    var carouselFactory: CarouselFactory!

    
    weak var menuFactory: MenuFactory?
    let dataFactory: DataLayerFactory = DataLayerFactory()
    
    required init(_ menuFactory:MenuFactory) {
        super.init()
        self.menuFactory = menuFactory
        self.listFactory = ListFactory(self)
        self.gridFactory = GridFactory(self)
        self.galleryFactory = GalleryFactory(self)
        self.stackFactory = StackFactory(self)
        self.carouselFactory = CarouselFactory(self)
    }
    
    
    public func view(item: MenuSelectedItem) -> EmplesCollectionViewProtocol {
        
        switch item {
        case .List:
            return self.listFactory.view()
        case .Grid:
            return self.gridFactory.view()
        case .Stack:
            return self.stackFactory.view()
        case .Gallery:
            return self.galleryFactory.view()
        case .Carusel:
            return self.carouselFactory.view()
        }
    }

    func model() -> EmplesAreasModel {
        return weakShared(EmplesAreasModel(dataFactory.fileReaderClient()))
    }

    func router() -> EmplesItemRouter {
        return shared(EmplesItemRouter()) { router in
            router.viewController = self.menuFactory?.router().viewController
            router.detailFactory = self.detailFactory()
        }
    }
    
    func detailFactory() -> DetailFactory {
        return shared(DetailFactory())
    }
    
    deinit {
        print("deinit CollectionFactory")
    }
}
