//
//  EmplesCollectionController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesCollectionPresenter: NSObject, PresenterUICycleProtocol {

    weak var view: CollectionViewProtocol?
    var router: EmplesItemRouter?
    var displayCollectionUseCase:DisplayAreaCollectionUseCase!

    func viewDidLoad() {
        
        self.view?.showProgressView()
        self.displayCollectionUseCase.displayAreaCollection { (result) in
            switch result {
            case .failure(let error):
                self.router?.showAlertWithTitle(title: "Error", message: error.localizedDescription)
            case .success(let areas):
                if let preparedArray = self.prepareArray(areas) {
                    self.view?.showSourceItems(preparedArray)
                }
            }
        }
    }
    
    func prepareArray(_ area:Array<RecArea>) -> Array<Any>? {
        return nil
    }
    
    func select(_ item:RecArea) {
        self.router?.showDetail(of: item)
    }
    
}

