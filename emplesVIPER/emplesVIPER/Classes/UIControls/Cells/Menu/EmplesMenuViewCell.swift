//
//  EmplesMenuViewCell.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesMenuViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    var model : EmplesMenuCellModel? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension EmplesMenuViewCell : NibLoadableView {
    
}

extension EmplesMenuViewCell : ViewCellProtocol {
    
    func configureModel(_ newModel: ViewCellModelProtocol) {
        if let item = newModel as? EmplesMenuCellModel {
            self.model = item;
            self.titleLabel.text = self.model!.text;
            self.titleLabel.font = self.model!.font;
            self.titleLabel.textColor = self.model!.textColor;
            self.contentView.backgroundColor = self.model!.bgColor;
        }
    }
}
