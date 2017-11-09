//
//  EmplesMenuRouter.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

class EmplesMenuRouter : BaseRouter {
    
    func navigate(item:MenuSelectedItem) {
        
        let client = DataAreaRequestClient(with: EmplesFSJsonReader())
        let model = EmplesAreasModel(client)
        let router = EmplesItemRouter(self.viewController)
        let controller = EmplesCollectionController(model)
        controller.router = router;
        
        switch item {
        case .List:
            let decorator = EmplesListModelDecorator(model)
            let view = EmplesListView()
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            self.viewController?.pushViewController(view, animated: true)
        case .Grid:
            let decorator = EmplesGridModelDecorator(model)
            let view = EmplesGridView()
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            self.viewController?.pushViewController(view, animated: true)
        case .Gallery:
            let decorator = EmplesGridModelDecorator(model)
            let view = EmplesGalleryView()
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            self.viewController?.pushViewController(view, animated: true)
        case .Stack:
            let decorator = EmplesListModelDecorator(model)
            let view = EmplesStackedView()
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            self.viewController?.pushViewController(view, animated: true)
        case .Carusel:
            let decorator = EmplesListModelDecorator(model)
            let view = EmplesCarouselView()
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            self.viewController?.pushViewController(view, animated: true)
        }
    }
}
