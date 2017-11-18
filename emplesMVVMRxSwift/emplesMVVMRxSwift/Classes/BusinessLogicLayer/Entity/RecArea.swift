//
//  EmplesRecArea.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

struct RecArea {
    let orgRecAreaID: String?
    let lastUpdatedDate: String?
    let recAreaEmail: String?
    let recAreaReservationURL: String?
    let recAreaID: Int?
    let recAreaPhone: String?
    let recAreaDescription: String?
    let stayLimit: String?
    let recAreaMapURL: String?
    let latitude: Float32?
    let longitude: Float32?
    let recAreaFeeDescription: String?
    let recAreaDirections: String?
    let keywords: String?
    let recAreaName: String?
    let imageURL: String?
    
    // MARK: - JSON -> Event
    init?(dictionary: [String: Any]) {
        
        orgRecAreaID = dictionary["OrgRecAreaID"] as? String
        lastUpdatedDate = dictionary["LastUpdatedDate"] as? String
        recAreaEmail = dictionary["RecAreaEmail"] as? String
        recAreaReservationURL = dictionary["RecAreaReservationURL"] as? String
        recAreaID = dictionary["RecAreaID"] as? Int
        recAreaPhone = dictionary["RecAreaPhone"] as? String
        recAreaDescription = dictionary["RecAreaDescription"] as? String
        stayLimit = dictionary["StayLimit"] as? String
        recAreaMapURL = dictionary["RecAreaMapURL"] as? String
        latitude = dictionary["RecAreaLatitude"] as? Float32
        longitude = dictionary["RecAreaLongitude"] as? Float32
        recAreaFeeDescription = dictionary["RecAreaFeeDescription"] as? String
        recAreaDirections = dictionary["RecAreaDirections"] as? String
        keywords = dictionary["Keywords"] as? String
        recAreaName = dictionary["RecAreaName"] as? String
        imageURL = dictionary["imageURL"] as? String
        
        
    }
}

