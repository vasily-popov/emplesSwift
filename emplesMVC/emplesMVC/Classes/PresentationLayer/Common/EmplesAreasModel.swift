//
//  EmplesAreasModel.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

protocol EmplesAreaProtocolDelegate:class {
    
    func finish(withResult result:Result<EmplesAreasModel>)
    func select(_ item:RecArea)
}

class EmplesAreasModel: NSObject{
    weak var delegate :EmplesAreaProtocolDelegate?
    var dataSource: Array<RecArea> = []
    private let client:DataAreaRequestClient!
    required init(_ client:DataAreaRequestClient) {
        self.client = client
        super.init()
    }
    
    func fetchAreas() {
        client.getAreas { [unowned self] (result) in
            switch result {
            case .failure(let error):
                self.delegate?.finish(withResult: Result.failure(error))
            case .success(let array):
                
                array.forEach({ (item) in
                    if let item = item as? EmplesRecAreaMappable {
                        let area = item.convert()
                        self.dataSource.append(area)
                    }
                })
                self.delegate?.finish(withResult: Result.success(self))
            }
        }
    }
}
