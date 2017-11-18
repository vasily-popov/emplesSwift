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
    
    private let source:CarouselViewSource!
    init(with source:CarouselViewSource) {
        self.source = source
        super.init()
    }
}
extension CarouselViewDelegate: iCarouselDelegate {
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        guard let row = source.items.value?[index] else {return}
        row.selectAction?(row.model, index)
    }
}

