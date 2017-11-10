//
//  EmplesItemRouter.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesItemRouter: BaseRouter {

    var detailFactory: DetailFactory!
    
    func showDetail(of item:RecArea) {
        
        let view = detailFactory.view(item)
        self.viewController?.pushViewController(view, animated: true)
    }
    
}

