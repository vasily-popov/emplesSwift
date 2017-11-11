//
//  DetailDescriptionViewCell.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class DetailDescriptionViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var iconView: UIImageView!
    var model : DetailDescriptionCellModel? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension DetailDescriptionViewCell : NibLoadableView {
    
}

extension DetailDescriptionViewCell : ViewCellProtocol {
    
    func configureModel(_ newModel: ViewCellModelProtocol) {
        
        if let item = newModel as? DetailDescriptionCellModel {
            self.model = item;
            self.textView.text = self.model!.descriptionText
            self.textView.font = self.model!.font
            self.textView.textColor = self.model!.textColor
            
            self.contentView.backgroundColor = self.model!.bgColor;
            
            if let url = self.model?.imageURL {
                self.iconView.kf.setImage(with: URL(string: url))
            }
        }
    }
}

