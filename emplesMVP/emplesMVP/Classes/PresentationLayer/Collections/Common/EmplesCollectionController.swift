//
//  EmplesCollectionController.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

protocol ViewCollectionProtocol {
    func viewDidLoad()
}

class EmplesCollectionController: NSObject, ViewCollectionProtocol {

    weak var view: EmplesCollectionViewProtocol?
    var router: EmplesItemRouter?
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
}

extension EmplesCollectionController :EmplesAreaProtocolDelegate {
    
    func finish(withResult result:Result<EmplesAreasModel>) {
        self.view?.hideProgressView()
        switch result {
        case .failure(let error):
            self.router?.showAlertWithTitle(title: "Error", message: error.localizedDescription)
            break
        case .success(_):
            self.view?.showData()
        }
    }
    
    func select(_ item:RecArea) {
        self.router?.showDetail(of: item)
    }
}
