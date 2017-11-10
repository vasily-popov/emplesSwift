//
//  DataLayerAssembly.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import FieryCrucible
import UIKit

class DataLayerFactory : DependencyFactory {
    
    func fileReaderClient() -> DataAreaRequestClient {
        return shared(DataAreaRequestClient(with:self.fileReaderFactory()))
    }
    
    private func fileReaderFactory() -> DataRequestProtocol {
        return shared(EmplesFSJsonReader())
    }
    
    deinit {
        print("deinit DataLayerFactory")
    }
}
