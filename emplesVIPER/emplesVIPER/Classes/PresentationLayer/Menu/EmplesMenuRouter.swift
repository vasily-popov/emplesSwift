//
//  EmplesMenuRouter.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Dip

class EmplesMenuRouter : BaseRouter {
    
    var module: DependencyContainer!
    
    func navigate(item:MenuSelectedItem) {
        
        let collectionView = try? module.resolve(tag: item) as CollectionViewProtocol
        if let view = collectionView  as? UIViewController {
            self.viewController?.pushViewController(view, animated: true)
        }
    }
}
