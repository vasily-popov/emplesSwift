//
//  ViewCellModelProtocol.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/8/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

protocol ViewCellModelProtocol {
    
    //associatedtype T
    var modelValue:Any? {get}
    var cellClassName:String {get}
    
}

//func dequeueCell<T>(ofType type: T.Type) -> T {
