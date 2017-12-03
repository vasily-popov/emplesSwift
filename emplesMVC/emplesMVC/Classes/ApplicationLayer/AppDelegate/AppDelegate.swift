//
//  AppDelegate.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/6/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

//@UIApplicationMain

class AppDelegate: BaseAppDelegate {
    
    var factory: AppDelegateFactory!
    
    override var services: [ApplicationService] {
        return [
            AppearanceService(),
            GoogleService()
        ]
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool
    {
        _ = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        factory = AppDelegateFactory()
        factory.application().launch()
        return true
    }
}

class MainApplication {
    var factory: AppDelegateFactory!
    
    func launch() {
        factory.mainWindow().makeKeyAndVisible()
    }
}



