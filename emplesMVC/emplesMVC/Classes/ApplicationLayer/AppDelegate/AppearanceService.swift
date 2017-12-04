//
//  AppearanceService.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/6/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class AppearanceService: NSObject, ApplicationService {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        UINavigationBar.appearance().tintColor = UIColor.blue
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance()
            .titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.green,
                                    NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 15.0)]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
            .setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.green,
                                     NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 15.0)], for: .normal)
        UINavigationBar.appearance().isTranslucent = false
        return true
    }    
}
