//
//  UIColor+Test.swift
//  emplesMVCTests
//
//  Created by Vasily Popov on 12/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

@testable import emplesMVC
import UIKit
import Quick
import Nimble

class UIColorSpec: QuickSpec {
    
    override func spec() {
        describe("HexColor") {
            
            it("should exist") {
                let color = UIColor.color(fromHex:0xFFFFFF)
                expect(color).notTo(beNil())
            }
            
            it("should exist with alfa") {
                let color = UIColor.color(fromHex: 0xFFFFFF, alpha: 0.4)
                expect(color).notTo(beNil())
            }
            
            it("should convert valid hex string to color") {
                let color = UIColor.color(fromString:"#AABBCC")
                expect(color).notTo(beNil())
            }
            
            it("should convert valid hex string (without #) to color") {
                let color = UIColor.color(fromString:"AABBCC")
                expect(color).notTo(beNil())
            }
            
            it("should not convert invalid hex string to color") {
                let color = UIColor.color(fromString:"#")
                expect(color).to(beNil())
                
                let color1 = UIColor.color(fromString:"")
                expect(color1).to(beNil())
            }
        }
    }
}

