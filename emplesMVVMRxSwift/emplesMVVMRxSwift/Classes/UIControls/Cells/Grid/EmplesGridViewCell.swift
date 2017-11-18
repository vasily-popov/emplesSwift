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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var viewModel: EmplesGridCellViewModel! {
        didSet {
            
            titleLabel.text = viewModel.text
            titleLabel.font = viewModel.font
            titleLabel.textColor = viewModel.textColor

            contentView.backgroundColor = viewModel.bgColor
            
            if let url = viewModel.imageURL {
                iconView.kf.setImage(with: URL(string: url))
            }
        }
    }
}

extension EmplesGridViewCell : NibLoadableView {

}

extension EmplesGridViewCell : ConfigurableCell {
    
    func configure(_ model: ViewCellModelProtocol) {
        
        if let item = model as? EmplesGridCellViewModel {
            self.viewModel = item
        }
    }
}
