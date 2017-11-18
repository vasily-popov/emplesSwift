//
//  CarouselViewSource.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import iCarousel
import RxSwift

class CarouselViewSource: NSObject {
    
    let items: Variable<[DataSourceItem]?>
    
    init(with source: Variable<[DataSourceItem]?>) {
        self.items = source
        super.init()
    }
}

extension CarouselViewSource: iCarouselDataSource {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.value?.count ?? 0
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var itemView: EmplesItemView!
        if let view = view as? EmplesItemView {
            itemView = view
        }
        else {
            if let loadedView = Bundle.main.loadNibNamed(EmplesItemView.nameOfClass, owner: self, options: nil)?.first as? EmplesItemView {
                itemView = loadedView
                let screenSize = UIScreen.main.bounds
                if screenSize.width > screenSize.height {
                    itemView?.frame = CGRect(x: 0, y: 0, width: screenSize.width * 0.6, height: screenSize.height * 0.8)
                }
                else {
                    itemView?.frame = CGRect(x: 0, y: 0, width: screenSize.width * 0.8, height: screenSize.height * 0.6)
                }
            }
        }
        
        let source = items.value![index]
        itemView.update(with: source.model)
        return itemView
    }
    
}
