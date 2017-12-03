//
//  main.swift
//  emplesMVC
//
//  Created by Vasily Popov on 12/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

let appDelegateClass: AnyClass? =
    NSClassFromString("emplesMVCTests.TestingAppDelegate") ?? AppDelegate.self
let args = UnsafeMutableRawPointer(CommandLine.unsafeArgv)
    .bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))
UIApplicationMain(CommandLine.argc, args, nil, NSStringFromClass(appDelegateClass!))

