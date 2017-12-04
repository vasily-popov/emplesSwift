//
//  CarouselViewSource.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import iCarousel

class CarouselViewSource: NSObject, GenericTableViewSourceProtocol {
    
    var elements: [DataSourceItem] = []
    
    convenience init(with source:[DataSourceItem]?) {
        self.init()
        if let source = source {
            self.elements += source
        }
    }
    
    public func setDataSource(_ dataSource:[DataSourceItem]) {
        self.elements = Array(dataSource)
    }
    
    public func appendItems(_ items:[DataSourceItem]) {
        self.elements += items
    }

}

extension CarouselViewSource: iCarouselDataSource {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return elements.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var itemView: EmplesItemView? = nil
        if let view = view as? EmplesItemView {
            itemView = view
        } else {
            if let loadedView = Bundle.main.loadNibNamed(EmplesItemView.nameOfClass, owner: self, options: nil)?.first as? EmplesItemView {
                itemView = loadedView
                let screenSize = UIScreen.main.bounds
                if screenSize.width > screenSize.height {
                    itemView?.frame = CGRect(x: 0, y: 0, width: screenSize.width * 0.6, height: screenSize.height * 0.8)
                } else {
                    itemView?.frame = CGRect(x: 0, y: 0, width: screenSize.width * 0.8, height: screenSize.height * 0.6)
                }
            }
        }
        let row = elements[index]
        itemView?.configureModel(row.model)
        return itemView!
    }
    
}
