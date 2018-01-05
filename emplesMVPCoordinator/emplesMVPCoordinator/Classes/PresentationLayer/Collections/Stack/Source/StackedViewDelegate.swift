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
    
    private var dataSource: GenericTableViewSourceProtocol?
    
    convenience init(with source:GenericTableViewSourceProtocol) {
        self.init()
        self.dataSource = source
    }
}
extension StackedViewDelegate: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.resetCurrentCardIndex()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        let row = self.dataSource!.elements[index]
        row.selectAction?(row.model, index)
    }
    
    func koloda(koloda: KolodaView, shouldSwipeCardAtIndex index: UInt, inDirection direction: SwipeResultDirection) -> Bool {
        return true
    }
}

