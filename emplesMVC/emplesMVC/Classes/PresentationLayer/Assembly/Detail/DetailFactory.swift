//
//  DetailFactory.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import FieryCrucible

class DetailFactory : DependencyFactory {
    
    override init() {
        super.init()
    }
    
    public func view(_ area: RecArea) -> DetailView {
        return scoped(DetailView()) { view in
            view.model = self.model(area)
            view.controller = self.controller(area)
        }
    }
    
    func model(_ area: RecArea) -> DetailAreaModel {
        return scoped(DetailAreaModel(area))
    }
    
    func controller(_ area: RecArea) -> DetailController {
        return scoped(DetailController(self.model(area))) { controller in
            controller.view = self.view(area)
        }
    }
    
    deinit {
        print("deinit DetailFactory")
    }
}
