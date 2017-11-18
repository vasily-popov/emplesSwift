//
//  StackedViewDelegate.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Koloda
import pop

class StackedViewDelegate: NSObject {
    
    private let source:StackedViewSource!
    init(with source:StackedViewSource) {
        self.source = source
        super.init()
    }
}
extension StackedViewDelegate: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.resetCurrentCardIndex()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        guard let row = source.items.value?[index] else {return}
        row.selectAction?(row.model, index)
    }
    
    func koloda(koloda: KolodaView, shouldSwipeCardAtIndex index: UInt, inDirection direction: SwipeResultDirection) -> Bool {
        return true
    }
}

