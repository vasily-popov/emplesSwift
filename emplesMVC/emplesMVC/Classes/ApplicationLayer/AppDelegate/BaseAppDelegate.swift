//
//  BaseAppDelegate.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/6/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import CloudKit
import Intents

public protocol ApplicationService: UIApplicationDelegate {}

class BaseAppDelegate: UIResponder, ApplicationService {
    
    public var window: UIWindow?
    open var services: [ApplicationService] { return [] }
    private lazy var __services: [ApplicationService] = {
        return self.services
    }()
    
    @available(iOS 2.0, *)
    open func applicationDidFinishLaunching(_ application: UIApplication) {
        __services.forEach { $0.applicationDidFinishLaunching?(application) }
    }
    
    @available(iOS 6.0, *)
    open func application(_ application: UIApplication,
                          willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        var result = false
        for service in __services {
            if service.application?(application, willFinishLaunchingWithOptions: launchOptions) ?? false {
                result = true
            }
        }
        return result
    }
    
    @available(iOS 3.0, *)
    open func application(_ application: UIApplication,
                          didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        var result = false
        for service in __services {
            if service.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? false {
                result = true
            }
        }
        return result
    }
    
    @available(iOS 2.0, *)
    open func applicationDidBecomeActive(_ application: UIApplication) {
        for service in __services {
            service.applicationDidBecomeActive?(application)
        }
    }
    
    @available(iOS 2.0, *)
    open func applicationWillResignActive(_ application: UIApplication) {
        for service in __services {
            service.applicationWillResignActive?(application)
        }
    }
    
    @available(iOS 9.0, *)
    open func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        var result = false
        for service in __services {
            if service.application?(app, open: url, options: options) ?? false {
                result = true
            }
        }
        return result
    }
    
    @available(iOS 2.0, *)
    open func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        for service in __services {
            service.applicationDidReceiveMemoryWarning?(application)
        }
    }
    
    @available(iOS 2.0, *)
    open func applicationWillTerminate(_ application: UIApplication) {
        for service in __services {
            service.applicationWillTerminate?(application)
        }
    }
    
    @available(iOS 2.0, *)
    open func applicationSignificantTimeChange(_ application: UIApplication) {
        for service in __services {
            service.applicationSignificantTimeChange?(application)
        }
    }
    
    
    @available(iOS 2.0, *)
    open func application(_ application: UIApplication,
                          willChangeStatusBarOrientation newStatusBarOrientation: UIInterfaceOrientation,
                          duration: TimeInterval) {
        for service in __services {
            service.application?(application, willChangeStatusBarOrientation: newStatusBarOrientation, duration: duration)
        }
    }
    
    @available(iOS 2.0, *)
    open func application(_ application: UIApplication,
                          didChangeStatusBarOrientation oldStatusBarOrientation: UIInterfaceOrientation) {
        for service in __services {
            service.application?(application, didChangeStatusBarOrientation: oldStatusBarOrientation)
        }
    }
    
    @available(iOS 3.0, *)
    open func application(_ application: UIApplication,
                          didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        for service in __services {
            service.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        }
    }
    
    @available(iOS 3.0, *)
    open func application(_ application: UIApplication,
                          didFailToRegisterForRemoteNotificationsWithError error: Error) {
        for service in __services {
            service.application?(application, didFailToRegisterForRemoteNotificationsWithError: error)
        }
    }
    
    @available(iOS 7.0, *)
    open func application(_ application: UIApplication,
                          didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                          fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        for service in __services {
            service.application?(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
        }
    }
    
    @available(iOS 7.0, *)
    open func application(_ application: UIApplication,
                          performFetchWithCompletionHandler completionHandler: @escaping(UIBackgroundFetchResult) -> Swift.Void) {
        for service in __services {
            service.application?(application, performFetchWithCompletionHandler: completionHandler)
        }
    }
    
    @available(iOS 7.0, *)
    open func application(_ application: UIApplication,
                          handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Swift.Void) {
        for service in __services {
            service.application?(application,
                                 handleEventsForBackgroundURLSession: identifier,
                                 completionHandler: completionHandler)
        }
    }
    
    
    @available(iOS 8.2, *)
    open func application(_ application: UIApplication,
                          handleWatchKitExtensionRequest userInfo: [AnyHashable : Any]?,
                          reply: @escaping ([AnyHashable : Any]?) -> Swift.Void) {
        for service in __services {
            service.application?(application, handleWatchKitExtensionRequest: userInfo, reply: reply)
        }
    }
    
    @available(iOS 9.0, *)
    open func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
        for service in __services {
            service.applicationShouldRequestHealthAuthorization?(application)
        }
    }
    
    
    @available(iOS 4.0, *)
    open func applicationDidEnterBackground(_ application: UIApplication) {
        for service in __services {
            service.applicationDidEnterBackground?(application)
        }
    }
    
    @available(iOS 4.0, *)
    open func applicationWillEnterForeground(_ application: UIApplication) {
        for service in __services {
            service.applicationWillEnterForeground?(application)
        }
    }
    
    @available(iOS 8.0, *)
    open func application(_ application: UIApplication,
                          shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplicationExtensionPointIdentifier) -> Bool {
        var result = false
        for service in __services {
            if service.application?(application, shouldAllowExtensionPointIdentifier: extensionPointIdentifier) ?? true {
                result = true
            }
        }
        return result
    }
    
    @available(iOS 8.0, *)
    open func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        var result = false
        for service in __services {
            if service.application?(application, willContinueUserActivityWithType: userActivityType) ?? false {
                result = true
            }
        }
        return result
    }
    
    @available(iOS 8.0, *)
    open func application(_ application: UIApplication,
                          continue userActivity: NSUserActivity,
                          restorationHandler: @escaping ([Any]?) -> Swift.Void) -> Bool {
        var result = false
        for service in __services {
            if service.application?(application, continue: userActivity, restorationHandler: restorationHandler) ?? false {
                result = true
            }
        }
        return result
    }
    
    @available(iOS 8.0, *)
    open func application(_ application: UIApplication,
                          didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
        for service in __services {
            service.application?(application, didFailToContinueUserActivityWithType: userActivityType, error: error)
        }
    }
    
    @available(iOS 8.0, *)
    open func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
        for service in __services {
            service.application?(application, didUpdate: userActivity)
        }
    }
    
    @available(iOS 10.0, *)
    open func application(_ application: UIApplication, userDidAcceptCloudKitShareWith cloudKitShareMetadata: CKShareMetadata) {
        for service in __services {
            service.application?(application, userDidAcceptCloudKitShareWith: cloudKitShareMetadata)
        }
    }
    
    
    @available(iOS 11.0, *)
    open func application(_ application: UIApplication,
                          handle intent: INIntent, completionHandler: @escaping (INIntentResponse) -> Swift.Void) {
        for service in __services {
            service.application?(application, handle: intent, completionHandler:completionHandler)
        }
    }
}



