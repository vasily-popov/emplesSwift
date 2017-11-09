//
//  EmplesRecAreaMappable.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/7/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import ObjectMapper

class EmplesRecAreaMappable: Mappable {

    var orgRecAreaID: String?
    var lastUpdatedDate: String?
    var recAreaEmail: String?
    var recAreaReservationURL: String?
    var recAreaID: Int?
    var recAreaPhone: String?
    var recAreaDescription: String?
    var stayLimit: String?
    var recAreaMapURL: String?
    var recAreaLatitude: Float32?
    var recAreaLongitude: Float32?
    var recAreaFeeDescription: String?
    var recAreaDirections: String?
    var keywords: String?
    var recAreaName: String?
    var imageURL: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        orgRecAreaID <- map["OrgRecAreaID"]
        lastUpdatedDate <- map["LastUpdatedDate"]
        recAreaEmail <- map["RecAreaEmail"]
        recAreaReservationURL <- map["RecAreaReservationURL"]
        recAreaID <- map["RecAreaID"]
        recAreaPhone <- map["RecAreaPhone"]
        recAreaDescription <- map["RecAreaDescription"]
        stayLimit <- map["StayLimit"]
        recAreaMapURL <- map["RecAreaMapURL"]
        recAreaLatitude <- map["RecAreaLatitude"]
        recAreaLongitude <- map["RecAreaLongitude"]
        recAreaFeeDescription <- map["RecAreaFeeDescription"]
        recAreaDirections <- map["RecAreaDirections"]
        keywords <- map["Keywords"]
        recAreaName <- map["RecAreaName"]
        imageURL <- map["imageURL"]
    }
    
    func convert() -> RecArea {
        let area = RecArea()
        area.orgRecAreaID = self.orgRecAreaID
        area.lastUpdatedDate = self.lastUpdatedDate
        area.recAreaEmail = self.lastUpdatedDate
        area.recAreaReservationURL = self.recAreaReservationURL
        area.recAreaID = self.recAreaID
        area.recAreaPhone = self.recAreaPhone
        area.recAreaDescription = self.recAreaDescription
        area.stayLimit = self.stayLimit
        area.recAreaMapURL = self.recAreaMapURL
        area.latitude = self.recAreaLatitude
        area.longitude = self.recAreaLongitude
        area.recAreaFeeDescription = self.recAreaFeeDescription
        area.recAreaDirections = self.recAreaDirections
        area.keywords = self.keywords
        area.recAreaName = self.recAreaName
        area.imageURL = self.imageURL
        return area
    }
    
}
