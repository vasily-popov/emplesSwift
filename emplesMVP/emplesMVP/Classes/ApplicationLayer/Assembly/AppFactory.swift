//
//  AppFactory
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import FieryCrucible
import UIKit

class AppDelegateFactory : DependencyFactory {
    
    let menuComponent:MenuFactory!
    
    override init() {
        menuComponent = MenuFactory()
        super.init()
        menuComponent.appFactory = self
    }
    
    func application() -> MainApplication {
        return shared(MainApplication()) { instance in
            instance.factory = self
        }
    }
    
    func mainWindow() -> UIWindow {
        return shared(
            factory: {
                return UIWindow(frame: UIScreen.main.bounds)
        },
            configure: { instance in
                instance.rootViewController = self.rootViewController()
        }
        )
    }
    
    func rootViewController() -> UIViewController {
        return scoped(MainNavigationController()) { vc in
            vc.viewControllers = [
                self.menuComponent.view(),
            ]
        }
    }
    
    deinit {
        print("deinit CustomFactory")
    }
}

