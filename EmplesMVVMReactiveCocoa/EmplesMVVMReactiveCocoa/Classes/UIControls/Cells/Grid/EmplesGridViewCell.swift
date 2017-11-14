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
    
    var viewModel: EmplesGridCellModel! {
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

extension EmplesGridViewCell : ViewCellProtocol {
    
    func configureModel(_ newModel: ViewCellModelProtocol) {
        
        if let item = newModel as? EmplesGridCellModel {
            self.viewModel = item
        }
    }
}
