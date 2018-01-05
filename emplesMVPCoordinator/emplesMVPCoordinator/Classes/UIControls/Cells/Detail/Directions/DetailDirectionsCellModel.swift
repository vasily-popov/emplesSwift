//
//  DetailDirectionsCellModel.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class DetailDirectionsCellModel {
    
    var bgColor : UIColor
    var font : UIFont
    var directionText : String?
    var textColor : UIColor
    
    init() {
        self.bgColor = UIColor.white
        self.textColor = UIColor.black
        self.font = UIFont.systemFont(ofSize: 16.0)
    }
}

extension DetailDirectionsCellModel :ViewCellModelProtocol {
    var modelValue: Any? {
        return self.directionText
    }
    
    var cellClassName: String {
        return DetailDirectionTextViewCell.nameOfClass
    }
}
