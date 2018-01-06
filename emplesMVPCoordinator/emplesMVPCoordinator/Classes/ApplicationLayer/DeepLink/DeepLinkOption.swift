//
//  DeepLink.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/6/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

import Foundation
import UIKit

struct DeepLinkURLConstants {
    static let Carousel = "Carousel"
    static let List = "List"
    static let Item = "Item"
}

enum DeepLinkOption {
    case list
    case carousel
    case item(RecArea)
    
    static func build(with params: [String : AnyObject]?) -> DeepLinkOption? {
        let id = params?["id"] as? String
        //let itemID = params?["item_id"] as? String
        switch id {
        case DeepLinkURLConstants.Carousel?: return .carousel
        case DeepLinkURLConstants.List?: return .list
        //case DeepLinkURLConstants.Item: return .item(itemID)
        default: return nil
        }
    }
    
    static func build(with activity: NSUserActivity?) -> DeepLinkOption? {
        let id = activity?.activityType
        //let itemID = params?["item_id"] as? String
        switch id {
        case DeepLinkURLConstants.Carousel?: return .carousel
        case DeepLinkURLConstants.List?: return .list
        //case DeepLinkURLConstants.Item: return .item(itemID)
        default: return nil
        }
    }
    
    static func build(with shortcutItem: UIApplicationShortcutItem?) -> DeepLinkOption? {
        return nil
    }
    
    static func build(with url: URL) -> DeepLinkOption? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
            let host = components.host else { return nil }
        
        var pathComponents = components.path.components(separatedBy: "/")
        // the first component is empty
        pathComponents.removeFirst()
        switch host {
        case DeepLinkURLConstants.Carousel: return .carousel
        case DeepLinkURLConstants.List: return .list
        //case DeepLinkURLConstants.Item: return .item(itemID)
        default: return nil
        }
    }
}
