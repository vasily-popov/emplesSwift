//
//  MenuFactory.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//
import UIKit
import FieryCrucible

class MenuFactory : DependencyFactory {
    
    weak var appFactory: AppDelegateFactory?
    
    func view() -> EmplesMenuView {
        return scoped(EmplesMenuView()) { view in
            view.presenter = self.presenter()
        }
    }
    
    func presenter() -> EmplesMenuPresenter {
        return scoped(EmplesMenuPresenter(self.model())) { presenter in
            presenter.view = self.view()
            presenter.router = self.router()
        }
    }
    
    func model() -> EmplesMenuModel {
        return shared(EmplesMenuModel())
    }
    
    func router() -> EmplesMenuRouter {
        return shared(EmplesMenuRouter()) { router in
            router.window = self.appFactory?.mainWindow()
            router.viewController = self.appFactory?.rootViewController() as? UINavigationController
            router.collectionFactory = CollectionFactory(self)
        }
    }
    deinit {
        print("deinit MenuFactory")
    }
}
