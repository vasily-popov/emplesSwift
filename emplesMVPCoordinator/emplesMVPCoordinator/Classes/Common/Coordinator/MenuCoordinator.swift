//
//  MenuCoordinator.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/5/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

final class MenuCoordinator: Coordinator {
    
    private let coordinatorFactory: AppCoordinatorFactory
    private let presenter: EmplesMenuPresenter
    
    init(router: RouterType, coordinatorFactory: AppCoordinatorFactory, presenter: EmplesMenuPresenter) {
        self.coordinatorFactory = coordinatorFactory
        self.presenter = presenter
        super.init(router: router)
    }
    
    override func start() {
        presenter.onSelectMenuItem = runListFlow()
    }
    
    private func runListFlow() -> ((MenuSelectedItem) -> ()) {
        return { [weak self] item in
            self?.showList(item)
        }
    }
    
    private func showList(_ item:MenuSelectedItem) {
        
        let coordinator = coordinatorFactory.makeCollectionCoordinator(router:router, arg:item)
        addChild(coordinator)
        router.push(coordinator, animated: true) { [weak self, weak coordinator] in
            // This executes when the back button is pressed
            self?.removeChild(coordinator)
        }
        coordinator.start()
    }
}

