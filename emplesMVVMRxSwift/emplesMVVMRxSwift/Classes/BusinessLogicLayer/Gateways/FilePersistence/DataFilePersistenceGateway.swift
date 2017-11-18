//
//  DataAreaRequestClient.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/7/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation
import RxSwift

class DataFilePersistenceGateway {
    
    var reader :EmplesFSJsonReader!
    
    required init(with reader:EmplesFSJsonReader) {
        self.reader = reader
    }
}

extension DataFilePersistenceGateway : DataAreaGatewayProtocol {
    
    func getAreas() -> Observable<[RecArea]> {
        return self.reader.fetchAllAreas()
    }
}
