//
//  EmplesMenuCellModel.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesMenuCellModel {
    
    var bgColor : UIColor
    var font : UIFont
    var text : String?
    var textColor : UIColor

    init() {
        self.bgColor = UIColor.white
        self.textColor = UIColor.black
        self.font = UIFont.systemFont(ofSize: 16.0)
    }
}

extension EmplesMenuCellModel :ViewCellModelProtocol {
    var modelValue: Any? {
        return self.text
    }
    
    var cellClassName: String {
        return EmplesMenuViewCell.nameOfClass
    }
}


