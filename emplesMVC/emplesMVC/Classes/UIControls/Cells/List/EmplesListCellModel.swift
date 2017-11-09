//
//  EmplesListCellModel.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesListCellModel {
    
    var bgColor : UIColor
    var font : UIFont
    var text : String?
    var textColor : UIColor
    var phone : String?
    var secondFont : UIFont
    var secondColor : UIColor
    var imageURL : String?
    
    init() {
        self.bgColor = UIColor.white
        self.textColor = UIColor.black
        self.font = UIFont.systemFont(ofSize: 16.0)
        self.secondFont = UIFont.systemFont(ofSize: 14.0)
        self.secondColor = UIColor.green
    }
}

extension EmplesListCellModel :ViewCellModelProtocol {
    var modelValue: Any? {
        return self.text
    }
    
    var cellClassName: String {
        return EmplesListCellView.nameOfClass
    }
}


