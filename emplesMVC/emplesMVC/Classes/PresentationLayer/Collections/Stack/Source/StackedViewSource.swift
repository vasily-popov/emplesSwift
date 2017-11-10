//
//  StackedViewDataSource.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Koloda

class StackedViewSource: NSObject, GenericTableViewSourceProtocol {
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

extension StackedViewSource:KolodaViewDataSource {
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        guard let view = Bundle.main.loadNibNamed(EmplesItemView.nameOfClass, owner: self, options: nil)?.first as? EmplesItemView else {
            return UIView()
        }

        let item = self.elements[index]
        view.configureModel(item.model)
        return view
    }
    
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return elements.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
}

