//
//  BusinessLayerAssembly.swift
//  emplesVIPER
//
//  Created by Vasily Popov on 11/12/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Swinject

class BusinessLayerAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(DataRequestProtocol.self) { _ in EmplesFSJsonReader() }.inObjectScope(.container)
        container.register(DataAreaGatewayProtocol.self) { r in
            DataFilePersistenceGateway(with: r.resolve(DataRequestProtocol.self)!) }.inObjectScope(.container)
        container.register(DisplayAreaCollectionUseCase.self) { r in
            DisplayAreaCollectionUseCaseImplementation(with: r.resolve(DataAreaGatewayProtocol.self)!) }//.inObjectScope(.container)
    }
}
