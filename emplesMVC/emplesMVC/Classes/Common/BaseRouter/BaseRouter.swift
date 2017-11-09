//
//  BaseRouter.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

protocol RouterProtocol {

    func prepareForSegue(segue:UIStoryboardSegue, sender:Any?)
    func setRootViewController(vc:UIViewController)
    func popViewControllerAnimated(animated:Bool)
    func popToRootViewControllerAnimated(animated:Bool)
    func dismissViewControllerAnimated(animated:Bool, completion:(()-> Void)?)
    func showAlertWithTitle(title: String, message:String)

}

class BaseRouter {
    
    weak var viewController: UINavigationController?
    weak var window: UIWindow?
    
    required init(_ viewController:UINavigationController?, window:UIWindow? = nil) {
        self.viewController = viewController
        self.window = window
    }
}

extension BaseRouter : RouterProtocol {
    
    func prepareForSegue(segue:UIStoryboardSegue, sender:Any?) {
        
    }
    
    func setRootViewController(vc:UIViewController) {
        self.viewController = EmplesNavigationController(rootViewController: vc)
        self.window?.rootViewController = self.viewController
    }
    
    func popViewControllerAnimated(animated:Bool) {
        self.viewController?.popViewController(animated: animated)
    }
    
    func popToRootViewControllerAnimated(animated:Bool) {
        self.viewController?.popToRootViewController(animated: animated)
    }
    
    func dismissViewControllerAnimated(animated:Bool, completion:(()-> Void)?) {
        self.viewController?.dismiss(animated: true, completion: completion)
    }
    
    func showAlertWithTitle(title: String, message:String) {
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.modalPresentationStyle = .overCurrentContext;
        alert.providesPresentationContextTransitionStyle = true;
        alert.definesPresentationContext = true;
        alert.modalTransitionStyle = .crossDissolve;
        self.viewController?.present(alert, animated: true, completion: nil)
    }
    
}
