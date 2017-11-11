//
//  AppDelegate.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/6/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Dip

@UIApplicationMain

class AppDelegate: BaseAppDelegate {
    
    private let container = DependencyContainer.configure()
    
    override var services: [ApplicationService] {
        return [
            AppearanceService(),
            GoogleService()
        ]
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool
    {
        _ = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        self.window = try! container.resolve() as UIWindow
        self.window?.rootViewController = try! container.resolve() as MainNavigationController
        self.window?.makeKeyAndVisible()
        return true
    }
}

