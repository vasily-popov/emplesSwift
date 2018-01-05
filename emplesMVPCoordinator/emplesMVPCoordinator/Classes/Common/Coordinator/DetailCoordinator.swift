//
//  DetailCoordinator.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/5/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

import Foundation

final class DetailCoordinator: Coordinator {
    
    private let coordinatorFactory: AppCoordinatorFactory
    private let view: DetailView
    private let item: RecArea
    
    init(router: RouterType, coordinatorFactory: AppCoordinatorFactory, view: DetailView, item: RecArea) {
        self.coordinatorFactory = coordinatorFactory
        self.view = view
        self.item = item
        super.init(router: router)
    }
    
    override func start() {
        showDetail()
    }
    
    private func showDetail() {
        view.presenter?.setItem(item)
        router.push(view, animated: true, completion: nil)
    }
}
