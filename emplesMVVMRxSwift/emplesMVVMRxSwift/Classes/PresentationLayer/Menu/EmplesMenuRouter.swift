//
//  EmplesMenuRouter.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Swinject

class EmplesMenuRouter : BaseRouter {
    
    var assembler: CollectionAssembler!
    func navigate(item:MenuScreen) {
        
        switch item {
            
        case .List:
            
            if let view = assembler.resolver.resolve(EmplesListView.self, name: String(describing: item)) {
                self.viewController?.pushViewController(view, animated: true)
            }
            break
        case .Grid:
            if let view = assembler.resolver.resolve(EmplesGridView.self, name: String(describing: item)) {
                self.viewController?.pushViewController(view, animated: true)
            }
            break
        case .Stack:
            break
        case .Gallery:
            break
        case .Carousel:
            break
        }
        
        
        /*
        if let view = assembler.resolver.resolve(CollectionViewProtocol.self, name: String(describing: item)) as? UIViewController {
            self.viewController?.pushViewController(view, animated: true)
        }
 */
    }
}
