//
//  EmplesGridCellModel.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesGridCellViewModel {
    
    var bgColor : UIColor
    var font : UIFont
    var text : String?
    var textColor : UIColor
    var imageURL : String?
    
    init() {
        self.bgColor = UIColor.white
        self.textColor = UIColor.black
        self.font = UIFont.systemFont(ofSize: 16.0)
    }
}

extension EmplesGridCellViewModel :ViewCellModelProtocol {
    var modelValue: Any? {
        return self.text
    }
    
    var cellClassName: String {
        return EmplesGridViewCell.nameOfClass
    }
}
