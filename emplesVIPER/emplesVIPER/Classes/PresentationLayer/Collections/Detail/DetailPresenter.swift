//
//  DetailPresenter
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

class DetailPresenter {
    
    weak var view: DetailView?
    private let model: DetailAreaModel
    
    required init(_ model:DetailAreaModel) {
        self.model = model
    }
    
    func viewDidLoad() {
        self.view?.setTitleLabel(model.titleName?.uppercased())
        self.view?.showSourceItems(model.dataSource)
    }

}
