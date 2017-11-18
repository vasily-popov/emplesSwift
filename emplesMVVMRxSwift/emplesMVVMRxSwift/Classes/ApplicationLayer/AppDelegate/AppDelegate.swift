//
//  AppDelegate.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/6/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain

class AppDelegate: BaseAppDelegate {
    
    override var services: [ApplicationService] {
        return [
            AppearanceService(),
            GoogleService()
        ]
    }
    
    var rootAssembler = RootAssembler()
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool
    {
        _ = RootAssembler.rootAssembler()
        _ = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        self.window = rootAssembler.assembler.resolver.resolve(UIWindow.self)!
        self.window?.makeKeyAndVisible()
        return true
    }
}

