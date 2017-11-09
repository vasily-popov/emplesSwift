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
    
    var elements: Array<DataSourceItem> = []
    
    convenience init(with source:Array<DataSourceItem>?) {
        self.init()
        if let source = source {
            self.elements += source
        }
    }
    
    public func setDataSource(_ dataSource:Array<DataSourceItem>) {
        self.elements = Array(dataSource)
    }
    
    public func appendItems(_ items:Array<DataSourceItem>) {
        self.elements += items
    }

}

extension CarouselViewSource: iCarouselDataSource {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return elements.count;
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var itemView: EmplesItemView? = nil
        if let view = view as? EmplesItemView {
            itemView = view
        }
        else {
            if let loadedView = Bundle.main.loadNibNamed(EmplesItemView.nameOfClass, owner: self, options: nil)?.first as? EmplesItemView {
                itemView = loadedView
                let screenSize = UIScreen.main.bounds
                let size = CGRect(x: 0, y: 0, width: screenSize.width * 3/4, height: screenSize.height * 3/4)
                itemView?.frame = size
            }
        }
        let row = elements[index];
        itemView?.configureModel(row.model)
        return itemView!
    }
    
}
