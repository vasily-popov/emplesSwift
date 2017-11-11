//
//  EmplesItemRouter.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Dip

class EmplesItemRouter: BaseRouter {

    var module: DependencyContainer!
    
    func showDetail(of item:RecArea) {
        
        if let view = try? module.resolve() as DetailView,
            let model = try? module.resolve() as DetailAreaModel {
            model.model = item
            self.viewController?.pushViewController(view, animated: true)
        }
    }
    
}

