//
//  NSObject+String.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

public extension NSObject {
    public class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy:".").last!
    }
    
    public var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy:".").last!
    }
}
