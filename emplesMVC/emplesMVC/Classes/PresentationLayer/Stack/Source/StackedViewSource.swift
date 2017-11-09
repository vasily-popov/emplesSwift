//
//  StackedViewDataSource.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import ZLSwipeableView

class StackedViewSource: NSObject, GenericTableViewSourceProtocol {
    var elements: Array<DataSourceItem> = []
    var currentIndex:UInt = 0
    var numberOfActiveViews:UInt = 0
    
    convenience init(with source:Array<DataSourceItem>?) {
        self.init()
        if let source = source {
            self.elements += source
            currentIndex = 0
        }
    }
    
    public func setDataSource(_ dataSource:Array<DataSourceItem>) {
        self.elements = Array(dataSource)
        currentIndex = 0
    }
    
    public func appendItems(_ items:Array<DataSourceItem>) {
        self.elements += items
    }
}

extension StackedViewSource:ZLSwipeableViewDataSource {
    
    func nextView(for swipeableView: ZLSwipeableView!) -> UIView! {
        self.numberOfActiveViews = swipeableView.numberOfActiveViews
        if (self.currentIndex >= self.elements.count) {
            self.currentIndex = 0;
        }
        
        let frame = CGRect(x:0, y:0,
                          width: swipeableView.frame.size.width * 0.8,
                          height: swipeableView.frame.size.height * 0.8)
        
        guard let view = Bundle.main.loadNibNamed(EmplesItemView.nameOfClass, owner: self, options: nil)?.first as? EmplesItemView else {
            return UIView()
        }
        
        view.frame = frame
        let tap = UITapGestureRecognizer(target: self, action: #selector(didItemSelected(_:)))
        tap.numberOfTapsRequired = 1
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        
        let item = self.elements[Int(currentIndex)]
        currentIndex+=1
        view.configureModel(item.model)
        return view;
    }

    
    @objc func didItemSelected(_ recognizer:UITapGestureRecognizer) {
        var topIndex: Int = Int(self.currentIndex) - Int(self.numberOfActiveViews)
    
        if(topIndex < 0) {
            topIndex = topIndex + Int(self.elements.count)
        }
    
        let item = self.elements[Int(topIndex)];
        item.selectAction?(item.model, Int(topIndex))
    }
}

