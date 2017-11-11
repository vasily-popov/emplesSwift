//
//  CompositionRoot.swift
//  emplesMVP
//
//  Created by Vasily Popov on 11/11/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Dip
import UIKit

extension DependencyContainer {
    static func configure() -> DependencyContainer {
        return DependencyContainer { container in
            
            unowned let rootContainer = container
            Dip.logLevel = .Errors
            rootContainer.register(.singleton) {(UIApplication.shared.delegate as! AppDelegate) as AppDelegate}
            rootContainer.register(.singleton) {UIWindow(frame: UIScreen.main.bounds) as UIWindow}
            rootContainer.register(.singleton) {
                MainNavigationController() as MainNavigationController
                }.resolvingProperties { container, navVC in
                    navVC.viewControllers = [try container.resolve() as EmplesMenuView]
            }
            menuModule.collaborate(with: rootContainer)
        }
    }
}

let menuModule = DependencyContainer() { container in
    
    container.register() {EmplesMenuView() as EmplesMenuView}
        .resolvingProperties { container, view in
            view.presenter = try container.resolve() as EmplesMenuPresenter
    }
    container.register() {EmplesMenuPresenter($0) as EmplesMenuPresenter}
        .resolvingProperties { container, presenter in
            presenter.view = try container.resolve()
            presenter.router = try container.resolve() as EmplesMenuRouter
    }
    container.register() {EmplesMenuRouter() as EmplesMenuRouter}
        .resolvingProperties { container, router in
            router.window = try container.resolve() as UIWindow
            router.viewController = try container.resolve() as MainNavigationController
            router.module = collectionModule
    }
    container.register(.shared) {EmplesMenuModel() as EmplesMenuModel}
    collectionModule.collaborate(with: container)
}

let dataLayerModule = DependencyContainer() { container in
    
    container.register(.singleton) {EmplesFSJsonReader() as DataRequestProtocol}
    container.register(.singleton) {DataFilePersistenceGateway(with: $0) as DataAreaGatewayProtocol}
    container.register() {DisplayAreaCollectionUseCaseImplementation(with: $0) as DisplayAreaCollectionUseCase}
}

