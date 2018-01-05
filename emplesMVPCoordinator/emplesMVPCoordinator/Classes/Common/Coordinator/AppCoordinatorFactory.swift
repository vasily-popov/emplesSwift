//
//  CoordinatorFactoryImpl.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/5/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

import UIKit
import Dip

protocol AppCoordinatorFactory {
    func makeMenuCoordinator(router: RouterType) ->
        (configurator: Coordinator, toPresent: Presentable)
    func makeCollectionCoordinator(router: RouterType, arg: MenuSelectedItem) -> Coordinator
    func makeDetailCoordinator(router: RouterType, item: RecArea) -> Coordinator
}

final class AppCoordinatorFactoryImpl: AppCoordinatorFactory {
    
    private let container: DependencyContainer
    
    required init(container: DependencyContainer) {
        self.container = container
    }
    
    func makeMenuCoordinator(router: RouterType) ->
        (configurator: Coordinator, toPresent: Presentable) {
            let view = try! container.resolve() as EmplesMenuView
            let coordinator = MenuCoordinator(router: router,
                                              coordinatorFactory: self,
                                              presenter:view.presenter)
            return (coordinator, view)
    }
    
    func makeCollectionCoordinator(router: RouterType, arg: MenuSelectedItem) -> Coordinator {
        let view = try! container.resolve(tag: arg) as CollectionViewProtocol
        let coordinator = CollectionCoordinator(router: router,
                                                coordinatorFactory: self,
                                                view: view)
        return coordinator
    }
    
    func makeDetailCoordinator(router: RouterType, item: RecArea) -> Coordinator {
        let view = try! container.resolve() as DetailView
        let coordinator = DetailCoordinator(router: router,
                                            coordinatorFactory: self,
                                            view:view,
                                            item:item)
        return coordinator
    }
}

