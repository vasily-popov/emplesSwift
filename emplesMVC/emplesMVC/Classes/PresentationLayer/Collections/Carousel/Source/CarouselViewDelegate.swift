//
//  CarouselViewDelegate.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import iCarousel

class CarouselViewDelegate: NSObject {
    
    private var dataSource: GenericTableViewSourceProtocol?
    
    convenience init(with source:GenericTableViewSourceProtocol) {
        self.init()
        self.dataSource = source
    }
}
extension CarouselViewDelegate: iCarouselDelegate {
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        let row = self.dataSource!.elements[index]
        row.selectAction?(row.model, index)
    }
}

