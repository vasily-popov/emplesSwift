//
//  DisplayAreaCollectionUseCase.swift
//  emplesVIPER
//
//  Created by Vasily Popov on 11/11/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

typealias DisplayAreaResponseBlock = ((Result<[RecArea]>) -> Void)
protocol DisplayAreaCollectionUseCase {

    func displayAreaCollection(handler: @escaping DisplayAreaResponseBlock) -> Void
    
}
