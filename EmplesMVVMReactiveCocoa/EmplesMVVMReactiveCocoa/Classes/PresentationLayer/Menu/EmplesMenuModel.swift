//
//  EmplesMenuModel.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/8/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

enum MenuSelectedItem: Int {
    case List = 0
    case Grid
    case Stack
    case Gallery
    case Carousel
}

protocol EmplesMenuSelectProtocol : class {
    
    func select(_ item:MenuSelectedItem)
}

class EmplesMenuModel {
    private var source: Array<String> = {
        return [LocalizedStrings.kListString.localized,
                LocalizedStrings.kGridString.localized,
                LocalizedStrings.kStackString.localized,
                LocalizedStrings.kGalleryString.localized,
                LocalizedStrings.kCarouselString.localized
                ]
    }()
    
    lazy var dataSource:Array<DataSourceItem> = {
        return self.source.map({ (text) -> DataSourceItem in
            let item = EmplesMenuCellModel()
            item.text = text
            return DataSourceItem(model: item, rowHeight: 50.0, { [weak self] (model, index) in
                if let selsectedItem = MenuSelectedItem(rawValue: index) {
                    self?.delegate?.select(selsectedItem)
                }
            })
        })
    }()
    
    weak var delegate: EmplesMenuSelectProtocol?
}

