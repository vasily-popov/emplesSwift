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
    
    override lazy var services: [ApplicationService]  = [
                                                        AppearanceService(),
                                                        GoogleService()]
    
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
        
        self.window = try! container.resolve() as UIWindow
        self.window?.rootViewController = try! container.resolve() as MainNavigationController
        self.window?.makeKeyAndVisible()
        
        let notification = launchOptions?[.remoteNotification] as? [String: AnyObject]
        let deepLink = DeepLinkOption.build(with: notification)
        applicationCoordinator.start(with: deepLink)

        services.append(contentsOf: [PushNotificationService(applicationCoordinator),
                        DeepLinkService(applicationCoordinator),
                        ShortcutsService(applicationCoordinator)])
        return true
    }
}

