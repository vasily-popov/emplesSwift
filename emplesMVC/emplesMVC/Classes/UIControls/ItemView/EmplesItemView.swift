//
//  EmplesItemView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesItemView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    var model : EmplesListCellModel? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.brown.cgColor;
        self.layer.borderWidth = 2;
        self.layer.cornerRadius = 10;
    }
}

extension EmplesItemView : NibLoadableView {

}

extension EmplesItemView : ViewCellProtocol {
    
    func configureModel(_ newModel: ViewCellModelProtocol) {
        
        if let item = newModel as? EmplesListCellModel {
            self.model = item;
            self.titleLabel.text = self.model!.text
            self.titleLabel.font = self.model!.font
            self.titleLabel.textColor = self.model!.textColor
            self.backgroundColor = self.model!.bgColor;
            
            if let url = self.model?.imageURL {
                self.iconView.kf.setImage(with: URL(string: url))
            }
        }
    }
}

