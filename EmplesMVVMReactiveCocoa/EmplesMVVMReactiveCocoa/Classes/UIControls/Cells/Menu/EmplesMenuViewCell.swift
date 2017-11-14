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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var viewModel: EmplesMenuCellModel! {
        didSet {
            titleLabel.text = viewModel.text
            titleLabel.font = viewModel.font
            titleLabel.textColor = viewModel.textColor
            contentView.backgroundColor = viewModel.bgColor
        }
    }
}

extension EmplesMenuViewCell : NibLoadableView {
    
}

extension EmplesMenuViewCell : ViewCellProtocol {
    
    func configureModel(_ newModel: ViewCellModelProtocol) {
        if let item = newModel as? EmplesMenuCellModel {
            self.viewModel = item
        }
    }
}
