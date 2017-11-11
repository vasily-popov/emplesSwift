//
//  DataRequestProtocol.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/7/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import ObjectMapper

protocol DataRequestProtocol {
    func fetchAllAreas(with response:((Result<[Mappable]>) -> Void))
}
