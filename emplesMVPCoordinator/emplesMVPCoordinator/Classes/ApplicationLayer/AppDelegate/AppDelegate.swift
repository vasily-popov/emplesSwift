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
    
    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
    
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    
    
    private func makeCoordinator() -> Coordinator {
        return AppCoordinator(
            router: Router(navigationController: self.rootController),
            coordinatorFactory: AppCoordinatorFactoryImpl(container: container)
        )
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool
    {
        _ = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        let notification = launchOptions?[.remoteNotification] as? [String: AnyObject]
        let deepLink = DeepLinkOption.build(with: notification)
        
        self.window = try! container.resolve() as UIWindow
        self.window?.rootViewController = try! container.resolve() as MainNavigationController
        applicationCoordinator.start(with: deepLink)
        self.window?.makeKeyAndVisible()
        return true
    }
    
    override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        super.application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
        let dict = userInfo as? [String: AnyObject]
        let deepLink = DeepLinkOption.build(with: dict)
        applicationCoordinator.start(with: deepLink)
    }
    
    override func application(_ application: UIApplication, continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        let deepLink = DeepLinkOption.build(with: userActivity)
        applicationCoordinator.start(with: deepLink)
        return true
    }
}

