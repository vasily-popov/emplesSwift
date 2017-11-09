//
//  AppDelegate.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/6/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: BaseAppDelegate {
    
    override var services: [ApplicationService] {
        return [
            AppearanceService(),
            GoogleService()
        ]
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool
    {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        _ = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        let model = EmplesMenuModel()
        let decorator = EmplesMenuModelDecorator(model: model)
        let controller = EmplesMenuController(model)
        let view = EmplesMenuView()
        view.model = decorator
        view.controller = controller
        controller.view = view
        let navVC = EmplesNavigationController(rootViewController: view)
        let router = EmplesMenuRouter(navVC, window: self.window)
        controller.router = router
        self.window?.rootViewController = navVC;
        self.window?.makeKeyAndVisible()
        return true;
    }
}


