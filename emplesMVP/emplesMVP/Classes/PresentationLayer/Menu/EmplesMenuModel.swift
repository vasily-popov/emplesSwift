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
    case Carusel
}

protocol EmplesMenuSelectProtocol : class {
    
    func select(_ item:MenuSelectedItem)
}

class EmplesMenuModel {
    var dataSource: Array<String> = {
        return [LocalizedStrings.kListString.localized,
                LocalizedStrings.kGridString.localized,
                LocalizedStrings.kStackString.localized,
                LocalizedStrings.kGalleryString.localized,
                LocalizedStrings.kCarouselString.localized
                ]
    }()
    
    weak var delegate: EmplesMenuSelectProtocol?

}
