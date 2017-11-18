//
//  EmplesCollectionController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
/*
import ReactiveSwift

protocol EmplesCollectionViewModelProtocol : LifeCycleProtocol {
    var title: String {get}
    var delegate:Any? {get}
    var dataSource:Any? {get}
    var loadItemsAction: Signal<Bool, NSError> {get}
}

class EmplesCollectionViewModelBase: NSObject {
    
    weak var view: CollectionViewProtocol?
    var router: EmplesItemRouter?
    var displayCollectionUseCase:DisplayAreaCollectionUseCase!
    
    
    internal var loadItemsAction: Signal<Bool, NSError>
    private var loadItemsActionObserver: Signal<Bool, NSError>.Observer
    
    func select(_ item:RecArea) {
        self.router?.showDetail(of: item)
    }
    func showPreparedArray(_ area:Array<RecArea>) {
        
    }
    
    override init() {
        (loadItemsAction, loadItemsActionObserver) = Signal<Bool, NSError>.pipe()
        super.init()
    }
}

extension EmplesCollectionViewModelBase: LifeCycleProtocol {
    
    func viewDidLoad() {
        
        self.view?.showProgressView()
        self.displayCollectionUseCase.displayAreaCollection { (result) in
            switch result {
            case .failure(let error):
                self.router?.showAlertWithTitle(title: "Error", message: error.localizedDescription)
            case .success(let areas):
                self.showPreparedArray(areas)
                self.loadItemsActionObserver.send(value: true)
            }
        }
    }
}
 */

