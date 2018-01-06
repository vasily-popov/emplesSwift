//
//  MenuCoordinator.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/5/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

import UIKit
import Dip

final class MenuCoordinator: Coordinator {
    
    public var view: EmplesMenuView!
    public var container: DependencyContainer!
    
    override init(router: RouterType) {
        super.init(router: router)
    }
    
    override func start() {
        view.presenter.onSelectMenuItem = runListFlow()
    }
    
    private func runListFlow() -> ((MenuSelectedItem) -> ()) {
        return { [weak self] item in
            self?.showCollection(item)
        }
    }
    
    private func showCollection(_ item:MenuSelectedItem) {
        
        let coordinator = try! container.resolve(tag: item, arguments: router) as CollectionCoordinator
        addChild(coordinator)
        router.push(coordinator, animated: true) { [weak self, weak coordinator] in
            // This executes when the back button is pressed
            self?.removeChild(coordinator)
        }
        coordinator.start()
    }
    
    override func toPresentable() -> UIViewController? {
        return self.view
    }
}

