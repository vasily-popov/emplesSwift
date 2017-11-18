//
//  EmplesItemRouter.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Swinject

class EmplesItemRouter: BaseRouter {

    var assembler: DetailAssembler!
    
    func showDetail(of item:RecArea) {
        /*
        if let view = assembler.resolver.resolve(DetailView.self),
            let area = assembler.resolver.resolve(DetailAreaModel.self) {
                area.model = item
                self.viewController?.pushViewController(view, animated: true)
        }
 */
    }
    
}

