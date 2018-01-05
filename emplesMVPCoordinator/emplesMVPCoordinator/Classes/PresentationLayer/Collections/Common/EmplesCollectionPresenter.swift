//
//  EmplesCollectionController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesCollectionPresenter: NSObject, PresenterUICycleProtocol {
    
    var onItemSelected: ((RecArea) -> ())?
    var onShowError: ((String) -> ())?

    weak var view: CollectionViewProtocol?
    private var model: EmplesAreasModel
    
    required init(_ model:EmplesAreasModel) {
        self.model = model
        super.init()
        self.model.delegate = self
    }

    func viewDidLoad() {
        
        self.view?.showProgressView()
        self.model.fetchAreas()
    }
    
    func prepareArray() -> Array<Any>? {
        return nil
    }
    
}

extension EmplesCollectionPresenter :EmplesAreaProtocolDelegate {
    
    func finish(withResult result:Result<EmplesAreasModel>) {
        self.view?.hideProgressView()
        switch result {
        case .failure(let error):
            onShowError?(error.localizedDescription)
            break
        case .success( _):
            if let preparedArray = self.prepareArray() {
                self.view?.showSourceItems(preparedArray)
            }
        }
    }
    
    func select(_ item:RecArea) {
        onItemSelected?(item)
    }
}
