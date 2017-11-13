//
//  DetailAssembler.swift
//  emplesVIPER
//
//  Created by Vasily Popov on 11/13/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Swinject

class DetailAssembler {
    
    private let assembler : Assembler!
    public var resolver: Resolver {
        return assembler.resolver
    }
    init(parent: Assembler) {
        assembler = Assembler([DetailAssembly()], parent:parent)
    }
}

class DetailAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(DetailView.self) { _ in DetailView() }
            .initCompleted { (r, view) in
            view.presenter = r.resolve(DetailPresenter.self)
        }

        container.register(DetailPresenter.self) { r in  DetailPresenter(r.resolve(DetailAreaModel.self)!)
            }.initCompleted { (r, presenter) in
                presenter.view = r.resolve(DetailView.self)
        }
        container.register(DetailAreaModel.self) { _ in DetailAreaModel() }.inObjectScope(.weak)
    }
}
