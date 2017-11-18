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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var viewModel: EmplesListCellViewModel! {
        didSet {
            
            titleLabel.text = viewModel.text
            titleLabel.font = viewModel.font
            titleLabel.textColor = viewModel.textColor
            
            phoneLabel.text = viewModel.phone
            phoneLabel.font = viewModel.secondFont
            phoneLabel.textColor = viewModel.secondColor
            
            contentView.backgroundColor = viewModel.bgColor
            
            if let url = viewModel.imageURL {
                iconView.kf.setImage(with: URL(string: url))
            }
        }
    }
}

extension EmplesListCellView : NibLoadableView {

}

extension EmplesListCellView : ViewCellProtocol {
    
    func update(with newModel: ViewCellModelProtocol) {
        if let item = newModel as? EmplesListCellViewModel {
            self.viewModel = item
        }
    }
}
