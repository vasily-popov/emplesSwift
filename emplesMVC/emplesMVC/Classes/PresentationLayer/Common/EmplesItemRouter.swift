//
//  EmplesItemRouter.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesItemRouter: BaseRouter {

    func showDetail(of item:RecArea) {
        
        let model = DetailAreaModel(item)
        let controller = DetailController(model)
        let view = DetailView()
        view.model = model
        view.controller = controller
        controller.view = view
        self.viewController?.pushViewController(view, animated: true)
    }
    
}

