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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var viewModel: DetailDescriptionCellModel! {
        didSet {
            
            textView.text = viewModel.descriptionText
            textView.font = viewModel.font
            textView.textColor = viewModel.textColor
            
            contentView.backgroundColor = viewModel.bgColor
            
            if let url = viewModel.imageURL {
                iconView.kf.setImage(with: URL(string: url))
            }
        }
    }
}

extension DetailDescriptionViewCell : NibLoadableView {
    
}

extension DetailDescriptionViewCell : ViewCellProtocol {
    
    func configureModel(_ newModel: ViewCellModelProtocol) {
        
        if let item = newModel as? DetailDescriptionCellModel {
            self.viewModel = item;
        }
    }
}

