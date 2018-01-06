//
//  DetailCoordinator.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/5/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

import UIKit

final class DetailCoordinator: Coordinator {
    
    var view: DetailView!
    private let item: RecArea
    
    init(router: RouterType, item: RecArea) {
        self.item = item
        super.init(router: router)
    }
    
    override func start() {
        view.presenter?.setItem(item)
    }
    
    override func toPresentable() -> UIViewController? {
        return self.view
    }
}
