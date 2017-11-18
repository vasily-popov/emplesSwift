//
//  EmplesMenuModel.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/8/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

enum MenuScreen : Int {
    case List
    case Grid
    case Stack
    case Gallery
    case Carousel
}

class EmplesMenuModel {
    var source: Array<String> = {
        return [LocalizedStrings.kListString.localized,
                LocalizedStrings.kGridString.localized,
                LocalizedStrings.kStackString.localized,
                LocalizedStrings.kGalleryString.localized,
                LocalizedStrings.kCarouselString.localized
                ]
    }()
}

