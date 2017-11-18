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
                               /*CarouselAssembly() */], parent:parent)
    }
}

class CollectionRootAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(EmplesItemRouter.self) { _ in EmplesItemRouter() }.initCompleted { (r, router) in
            router.viewController = r.resolve(MainNavigationController.self)
            router.window = r.resolve(UIWindow.self)
            router.assembler = DetailAssembler(parent: r.resolve(CollectionAssembler.self)!.assembler)
        }
        
        container.register(EmplesListView.self, name: String(describing: MenuScreen.List)) { _ in EmplesListView() }
            .initCompleted { (r, view) in
            view.viewModel = r.resolve(EmplesListViewModel.self)
        }
        
        container.register(EmplesGridView.self, name: String(describing: MenuScreen.Grid)) { _ in EmplesGridView() }
            .initCompleted { (r, view) in
            view.viewModel = r.resolve(EmplesGridViewModel.self)
        }

        container.register(EmplesStackedView.self, name: String(describing: MenuScreen.Stack)) { _ in EmplesStackedView() }
            .initCompleted { (r, view) in
            view.viewModel = r.resolve(EmplesStackedViewModel.self)
        }

        container.register(EmplesGalleryView.self, name: String(describing: MenuScreen.Gallery)) { _ in EmplesGalleryView() }
            .initCompleted { (r, view) in
            view.viewModel = r.resolve(EmplesGalleryViewModel.self)
        }
/*
        container.register(CollectionViewProtocol.self, name: String(describing: MenuScreen.Carousel)) { _ in EmplesCarouselView() }.initCompleted { (r, view) in
            view.viewModel = r.resolve(EmplesCarouselViewModel.self)
        }
 */
    }
}
/*
class CarouselAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(EmplesCarouselViewModel.self) { _ in EmplesCarouselViewModel() }.initCompleted { (r, presenter) in
            presenter.view = r.resolve(CollectionViewProtocol.self,
                                       name: String(describing: MenuScreen.Carousel))
            presenter.router = r.resolve(EmplesItemRouter.self)
            presenter.displayCollectionUseCase = r.resolve(DisplayAreaCollectionUseCase.self)
        }
    }
}
*/
class GalleryAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(EmplesGalleryViewModel.self) { _ in EmplesGalleryViewModel(container.resolve(DisplayAreaCollectionUseCase.self)!) }
            .initCompleted { (r, presenter) in
            presenter.router = r.resolve(EmplesItemRouter.self)
        }
    }
}

class GridAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(EmplesGridViewModel.self) { _ in EmplesGridViewModel(container.resolve(DisplayAreaCollectionUseCase.self)!) }
            .initCompleted { (r, presenter) in
            presenter.router = r.resolve(EmplesItemRouter.self)
        }
    }
}

class ListAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(EmplesListViewModel.self) { _ in EmplesListViewModel(container.resolve(DisplayAreaCollectionUseCase.self)!) }
            .initCompleted { (r, presenter) in
            presenter.router = r.resolve(EmplesItemRouter.self)
        }
    }
}

class StackAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(EmplesStackedViewModel.self) { _ in EmplesStackedViewModel(container.resolve(DisplayAreaCollectionUseCase.self)!) }
            .initCompleted { (r, presenter) in
            presenter.router = r.resolve(EmplesItemRouter.self)
        }
    }
}
