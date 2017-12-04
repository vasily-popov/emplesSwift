//
//  EmplesGridViewCell.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesGridViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    var model : EmplesGridCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension EmplesGridViewCell : NibLoadableView {

}

extension EmplesGridViewCell : ViewCellProtocol {
    
    func configureModel(_ newModel: ViewCellModelProtocol) {
        
        if let item = newModel as? EmplesGridCellModel {
            self.model = item
            self.titleLabel.text = self.model!.text
            self.titleLabel.font = self.model!.font
            self.titleLabel.textColor = self.model!.textColor
            self.contentView.backgroundColor = self.model!.bgColor
            
            if let url = self.model?.imageURL {
                self.iconView.kf.setImage(with: URL(string: url))
            }
        }
    }
}
