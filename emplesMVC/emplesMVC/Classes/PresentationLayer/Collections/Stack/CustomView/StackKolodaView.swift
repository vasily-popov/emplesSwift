//
//  StackKolodaView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Koloda

let defaultTopOffset: CGFloat = 20
let defaultHorizontalOffset: CGFloat = 30
let defaultHeightRatio: CGFloat = 1.1

class StackKolodaView: KolodaView {

    override func frameForCard(at index: Int) -> CGRect {
        
        if self.frame.width > self.frame.height {
            
            let yOffset = defaultTopOffset * (1.0 + CGFloat(index) * 0.2)
            let xOffset = self.frame.width/4 + defaultHorizontalOffset*(CGFloat(index) * 0.1)
            let width = self.frame.width/2
            let height = self.frame.height * 0.9
            let frame = CGRect(x: xOffset, y: yOffset, width: width, height: height)
            return frame
        } else {
            let yOffset = defaultTopOffset * (1.0 + CGFloat(index) * 0.2)
            let xOffset = defaultHorizontalOffset * (1.0 + CGFloat(index) * 0.2)
            let width = self.frame.width - 2 * defaultHorizontalOffset
            let height = width * defaultHeightRatio
            let frame = CGRect(x: xOffset, y: yOffset, width: width, height: height)
            return frame
        }
    }
    
}
