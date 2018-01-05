//
//  AppCoordinator.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/5/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

import UIKit

struct DeepLinkURLConstants {
    static let Carousel = "carousel"
    static let List = "list"
    static let Item = "item"
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
}

protocol CoordinatorProtocol: class, Presentable {
    var router: RouterType { get }
    var onCompletion: (() -> Void)? { get set }
    func start()
    func start(with option: DeepLinkOption?)
}

class Coordinator: NSObject, CoordinatorProtocol {

    public var childCoordinators: [Coordinator] = []
    public var router: RouterType
    public init(router: RouterType) {
        self.router = router
        super.init()
    }
    var onCompletion: (() -> Void)?
    func start() {}
    func start(with option: DeepLinkOption?) {}
    
    public func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    public func removeChild(_ coordinator: Coordinator?) {
        if let coordinator = coordinator,
            let index = childCoordinators.index(of: coordinator) {
            childCoordinators.remove(at: index)
        }
    }
    func toPresentable() -> UIViewController? {
        return router.toPresentable()
    }
}
