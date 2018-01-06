//
//  PushNotificationService.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/6/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

import UIKit

class PushNotificationService: NSObject,ApplicationService {
    
    private let coordinator :Coordinator
    init(_ coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init()
    }
    
    // MARK: Push notification
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        let dict = userInfo as? [String: AnyObject]
        let deepLink = DeepLinkOption.build(with: dict)
        coordinator.start(with: deepLink)
        completionHandler(.newData)
    }
}
