//
//  AppCoordinator.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/5/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

import Dip

final class AppCoordinator: Coordinator {
    
    var container: DependencyContainer!
    
    override init(router: RouterType) {
        super.init(router: router)
    }
    
    override func start() {
        start(with: nil)
    }
    
    override func start(with link: DeepLinkOption?) {
        if let link = link {
            switch link {
            case .list:
                break
            case .carousel:
                break
            //case .item(let area):
            //    break
            default:
                childCoordinators.forEach { coordinator in
                    coordinator.start(with: link)
                }
            }
        } else {
            runMenuFlow()
        }
    }
    
    private func runMenuFlow() {
        let coordinator = try! container.resolve(arguments: router) as MenuCoordinator
        addChild(coordinator)
        router.setRootModule(coordinator, hideBar: false)
        coordinator.start()
    }
}
