//
//  ListCoordinator.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/5/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

import UIKit
import Dip

final class CollectionCoordinator: Coordinator {
    
    public var view: CollectionViewProtocol!
    public var container: DependencyContainer!
    
    override init(router: RouterType) {
        super.init(router: router)
    }
    
    override func start() {
        view.presenter?.onItemSelected = { [weak self] item in
            self?.showDetail(item)
        }
        
        view.presenter?.onShowError = { [weak self] message in
            
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.modalPresentationStyle = .overCurrentContext;
            alert.providesPresentationContextTransitionStyle = true;
            alert.definesPresentationContext = true;
            alert.modalTransitionStyle = .crossDissolve;
            self?.router.present(alert, animated: true)
        }
    }
    
    private func showDetail(_ item : RecArea) {
        
        let coordinator = try! container.resolve(arguments: router, item) as DetailCoordinator
        addChild(coordinator)
        router.push(coordinator, animated: true) { [weak self, weak coordinator] in
            // This executes when the back button is pressed
            self?.removeChild(coordinator)
        }
        coordinator.start()
    }
    
    override func toPresentable() -> UIViewController {
        return view as! UIViewController
    }
    
    deinit {
        print("CollectionCoordinator deinit")
    }
}
