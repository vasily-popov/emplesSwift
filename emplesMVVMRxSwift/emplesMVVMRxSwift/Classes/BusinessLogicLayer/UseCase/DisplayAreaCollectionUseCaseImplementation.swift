//
//  DisplayAreaCollectionUseCaseImplementation.swift
//  emplesVIPER
//
//  Created by Vasily Popov on 11/11/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation
import RxSwift

class DisplayAreaCollectionUseCaseImplementation: DisplayAreaCollectionUseCase {
    
    var gateway :DataAreaGatewayProtocol
    required init(with gateway:DataAreaGatewayProtocol) {
        self.gateway = gateway
    }
    
    func displayAreaCollection() -> Observable<[RecArea]> {
        return self.gateway.getAreas()
    }
}
