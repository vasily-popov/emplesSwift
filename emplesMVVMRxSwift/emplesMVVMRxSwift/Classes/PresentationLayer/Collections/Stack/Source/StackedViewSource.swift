//
//  StackedViewDataSource.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Koloda
import RxSwift

class StackedViewSource: NSObject {
    
    let items: Variable<[DataSourceItem]?>
    
    init(with source: Variable<[DataSourceItem]?>) {
        self.items = source
        super.init()
    }
}

extension StackedViewSource:KolodaViewDataSource {
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        guard let view = Bundle.main.loadNibNamed(EmplesItemView.nameOfClass, owner: self, options: nil)?.first as? EmplesItemView else {
            return UIView()
        }
        let source = items.value![index]
        view.configure(source.model)
        return view
    }
    
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return items.value?.count ?? 0
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
}

