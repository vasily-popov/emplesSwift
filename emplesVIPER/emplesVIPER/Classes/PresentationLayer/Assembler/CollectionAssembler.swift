//
//  CollectionAssembler.swift
//  emplesVIPER
//
//  Created by Vasily Popov on 11/12/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Swinject

class CollectionAssembler {
    
    fileprivate let assembler : Assembler!
    public var resolver: Resolver {
        return assembler.resolver
    }
    
    init(parent: Assembler) {
        assembler = Assembler([CollectionRootAssembly(),
                               ListAssembly(),
                               GridAssembly(),
                               GalleryAssembly(),
                               StackAssembly(),
                               CarouselAssembly()], parent:parent)
    }
}

class CollectionRootAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(EmplesItemRouter.self) { _ in EmplesItemRouter() }.initCompleted { (r, router) in
            router.viewController = r.resolve(MainNavigationController.self)
            router.window = r.resolve(UIWindow.self)
            router.assembler = DetailAssembler(parent: r.resolve(CollectionAssembler.self)!.assembler)
        }
        
        container.register(CollectionViewProtocol.self, name: String(describing: MenuSelectedItem.List)) { _ in EmplesListView() }
            .initCompleted { (r, view) in
            view.presenter = r.resolve(EmplesListPresenter.self)
        }
        container.register(CollectionViewProtocol.self, name: String(describing: MenuSelectedItem.Grid)) { _ in EmplesGridView() }
            .initCompleted { (r, view) in
            view.presenter = r.resolve(EmplesGridPresenter.self)
        }
        container.register(CollectionViewProtocol.self, name: String(describing: MenuSelectedItem.Stack)) { _ in EmplesStackedView() }
            .initCompleted { (r, view) in
            view.presenter = r.resolve(EmplesStackedPresenter.self)
        }
        container.register(CollectionViewProtocol.self, name: String(describing: MenuSelectedItem.Gallery)) { _ in EmplesGalleryView() }
            .initCompleted { (r, view) in
            view.presenter = r.resolve(EmplesGalleryPresenter.self)
        }
        container.register(CollectionViewProtocol.self, name: String(describing: MenuSelectedItem.Carousel)) { _ in EmplesCarouselView() }.initCompleted { (r, view) in
            view.presenter = r.resolve(EmplesCarouselPresenter.self)
        }
    }
}

class CarouselAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(EmplesCarouselView.self) { _ in EmplesCarouselView() }.initCompleted { (r, view) in
            view.presenter = r.resolve(EmplesCarouselPresenter.self)
        }
        container.register(EmplesCarouselPresenter.self) { _ in EmplesCarouselPresenter() }.initCompleted { (r, presenter) in
            presenter.view = r.resolve(CollectionViewProtocol.self,
                                       name: String(describing: MenuSelectedItem.Carousel))
            presenter.router = r.resolve(EmplesItemRouter.self)
            presenter.displayCollectionUseCase = r.resolve(DisplayAreaCollectionUseCase.self)
        }
    }
}

class GalleryAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(EmplesGalleryView.self) { _ in EmplesGalleryView() }.initCompleted { (r, view) in
            view.presenter = r.resolve(EmplesGalleryPresenter.self)
        }
        container.register(EmplesGalleryPresenter.self) { _ in EmplesGalleryPresenter() }.initCompleted { (r, presenter) in
            presenter.view = r.resolve(CollectionViewProtocol.self,
                                       name: String(describing: MenuSelectedItem.Gallery))
            presenter.router = r.resolve(EmplesItemRouter.self)
            presenter.displayCollectionUseCase = r.resolve(DisplayAreaCollectionUseCase.self)
        }
    }
}

class GridAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(EmplesGridView.self) { _ in EmplesGridView() }.initCompleted { (r, view) in
            view.presenter = r.resolve(EmplesGridPresenter.self)
        }
        container.register(EmplesGridPresenter.self) { _ in EmplesGridPresenter() }.initCompleted { (r, presenter) in
            presenter.view = r.resolve(CollectionViewProtocol.self,
                                       name: String(describing: MenuSelectedItem.Grid))
            presenter.router = r.resolve(EmplesItemRouter.self)
            presenter.displayCollectionUseCase = r.resolve(DisplayAreaCollectionUseCase.self)
        }
    }
}

class ListAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(EmplesListView.self) { _ in EmplesListView() }.initCompleted { (r, view) in
            view.presenter = r.resolve(EmplesListPresenter.self)
        }
        container.register(EmplesListPresenter.self) { _ in EmplesListPresenter() }.initCompleted { (r, presenter) in
            presenter.view = r.resolve(CollectionViewProtocol.self,
                                       name: String(describing: MenuSelectedItem.List))
            presenter.router = r.resolve(EmplesItemRouter.self)
            presenter.displayCollectionUseCase = r.resolve(DisplayAreaCollectionUseCase.self)
        }
    }
}

class StackAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(EmplesStackedView.self) { _ in EmplesStackedView() }.initCompleted { (r, view) in
            view.presenter = r.resolve(EmplesStackedPresenter.self)
        }
        container.register(EmplesStackedPresenter.self) { _ in EmplesStackedPresenter() }.initCompleted { (r, presenter) in
            presenter.view = r.resolve(CollectionViewProtocol.self,
                                       name: String(describing: MenuSelectedItem.Stack))
            presenter.router = r.resolve(EmplesItemRouter.self)
            presenter.displayCollectionUseCase = r.resolve(DisplayAreaCollectionUseCase.self)
        }
    }
}

