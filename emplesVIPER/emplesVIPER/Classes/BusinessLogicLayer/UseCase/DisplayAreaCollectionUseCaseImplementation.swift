//
//  DisplayAreaCollectionUseCaseImplementation.swift
//  emplesVIPER
//
//  Created by Vasily Popov on 11/11/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

class DisplayAreaCollectionUseCaseImplementation: DisplayAreaCollectionUseCase {
    
    var gateway :DataAreaGatewayProtocol
    required init(with gateway:DataAreaGatewayProtocol) {
        self.gateway = gateway
    }
    
    func displayAreaCollection(handler: @escaping DisplayAreaResponseBlock) -> Void {
        
        self.gateway.getAreas { (result) in
            switch result {
            case .failure(let error):
                handler(Result.failure(error))
            case .success(let array):
                
                var dataSource : Array<RecArea> = []
                array.forEach({ (item) in
                    if let item = item as? EmplesRecAreaMappable {
                        let area = item.convert()
                        dataSource.append(area)
                    }
                })
                handler(Result.success(dataSource))
            }
        }
    }
}
