//
//  ShortcutsService.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/6/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

import UIKit

class ShortcutsService: NSObject,ApplicationService {
    
    private let coordinator :Coordinator
    init(_ coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init()
    }
    
    // MARK: Shortcuts
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let deepLink = DeepLinkOption.build(with: shortcutItem)
        coordinator.start(with: deepLink)
        completionHandler(true)
    }
}
