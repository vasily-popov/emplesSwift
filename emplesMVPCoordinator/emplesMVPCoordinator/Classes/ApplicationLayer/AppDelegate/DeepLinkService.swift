//
//  DeepLinkService.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/6/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

import UIKit

class DeepLinkService: NSObject,ApplicationService {
    
    private let coordinator :Coordinator
    init(_ coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init()
    }
    
    // MARK: Universal Links
    func application(_ application: UIApplication, continue userActivity: NSUserActivity,
                              restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        let deepLink = DeepLinkOption.build(with: userActivity)
        coordinator.start(with: deepLink)
        return true
    }
    
    // MARK: Deeplinks
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let deepLink = DeepLinkOption.build(with: url)
        coordinator.start(with: deepLink)
        return true
    }
}
