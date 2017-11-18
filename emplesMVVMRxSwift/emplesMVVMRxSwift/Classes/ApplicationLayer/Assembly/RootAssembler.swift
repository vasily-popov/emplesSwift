//
//  RootAssembler.swift
//  emplesVIPER
//
//  Created by Vasily Popov on 11/12/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation
import Swinject

class RootAssembler {
    private (set) var assembler: Assembler!
    static func rootAssembler() -> RootAssembler {
        let assembler = Assembler([RootAssembly(), RootViewAssembly(), BusinessLayerAssembly()])
        let rootAssembler = assembler.resolver.resolve(RootAssembler.self)!
        rootAssembler.assembler = assembler
        return rootAssembler
    }
}

class RootAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(UIWindow.self) { _ in UIWindow(frame: UIScreen.main.bounds) }
            .initCompleted({ (r, window) in
                window.rootViewController = r.resolve(MainNavigationController.self)
            })
            .inObjectScope(.container)
        container.register(MainNavigationController.self) { _ in MainNavigationController() }
            .initCompleted { (r, nav) in
                nav.viewControllers = [r.resolve(EmplesMenuView.self)!]
            }.inObjectScope(.container)
        
        container.register(RootAssembler.self) { r in
            (UIApplication.shared.delegate as! AppDelegate).rootAssembler
        }
    }
}
