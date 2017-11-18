//
//  GoogleService.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/6/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleService: NSObject,ApplicationService {

    static var GOOGLE_MAPS_APIKEY = "AIzaSyBq67F_e2PQEWtKgCDDkHBpnVH1r383nQo"
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool
    {
        GMSServices.provideAPIKey(GoogleService.GOOGLE_MAPS_APIKEY)
        return true;
    }
    
}
