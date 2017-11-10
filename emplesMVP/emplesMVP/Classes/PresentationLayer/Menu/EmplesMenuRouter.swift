//
//  EmplesMenuRouter.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesMenuRouter : BaseRouter {
    
    var collectionFactory: CollectionFactory!
    
    func navigate(item:MenuSelectedItem) {
        
        if let view = collectionFactory.view(item: item) as? UIViewController {
            self.viewController?.pushViewController(view, animated: true)
        }
    }
}
