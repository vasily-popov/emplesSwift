//
//  DecoratorModelProtocol.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/8/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

protocol DecoratorModelProtocol {
    
    associatedtype T
    var dataSource: Array<T> {get}
    
}
