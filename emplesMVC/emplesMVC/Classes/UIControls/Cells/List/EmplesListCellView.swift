//
//  EmplesListCellView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Kingfisher

class EmplesListCellView: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    var model : EmplesListCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension EmplesListCellView : NibLoadableView {

}

extension EmplesListCellView : ViewCellProtocol {
    
    func configureModel(_ newModel: ViewCellModelProtocol) {
        
        if let item = newModel as? EmplesListCellModel {
            self.model = item
            self.titleLabel.text = self.model!.text
            self.titleLabel.font = self.model!.font
            self.titleLabel.textColor = self.model!.textColor
            
            self.phoneLabel.text = self.model!.phone
            self.phoneLabel.font = self.model!.secondFont
            self.phoneLabel.textColor = self.model!.secondColor
            self.contentView.backgroundColor = self.model!.bgColor
            
            if let url = self.model?.imageURL {
                self.iconView.kf.setImage(with: URL(string: url))
            }
        }
    }
}
