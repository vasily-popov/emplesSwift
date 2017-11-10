//
//  DetailFactory.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import FieryCrucible

class DetailFactory : DependencyFactory {
    
    override init() {
        super.init()
    }
    
    public func view(_ area: RecArea) -> DetailView {
        return scoped(DetailView()) { view in
            view.presenter = self.presenter(area)
        }
    }
    
    func model(_ area: RecArea) -> DetailAreaModel {
        return scoped(DetailAreaModel(area))
    }
    
    func presenter(_ area: RecArea) -> DetailPresenter {
        return scoped(DetailPresenter(self.model(area))) { presenter in
            presenter.view = self.view(area)
        }
    }
    
    deinit {
        print("deinit DetailFactory")
    }
}
