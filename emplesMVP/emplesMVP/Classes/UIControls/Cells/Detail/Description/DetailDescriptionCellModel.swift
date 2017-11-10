//
//  DetailDescriptionCellModel.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class DetailDescriptionCellModel {
    
    var bgColor : UIColor
    var font : UIFont
    var descriptionText : String?
    var textColor : UIColor
    var imageURL : String?
    
    init() {
        self.bgColor = UIColor.white
        self.textColor = UIColor.black
        self.font = UIFont.systemFont(ofSize: 16.0)
    }
}

extension DetailDescriptionCellModel :ViewCellModelProtocol {
    var modelValue: Any? {
        return self.descriptionText
    }
    
    var cellClassName: String {
        return DetailDescriptionViewCell.nameOfClass
    }
}

