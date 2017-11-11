//
//  DetailFactory.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Dip

let detailModule = DependencyContainer() { container in
    
    container.register() { DetailView() }
        .resolvingProperties { container, view in
            view.presenter = try container.resolve() as DetailPresenter
    }
    container.register() {DetailPresenter(try! container.resolve())}
        .resolvingProperties { container, presenter in
            presenter.view = try container.resolve()
    }
    container.register(.weakSingleton) {DetailAreaModel()}
}
