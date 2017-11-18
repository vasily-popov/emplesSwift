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
    
    var viewModel: EmplesMenuCellViewModel! {
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
    
    func update(with newModel: ViewCellModelProtocol) {
        if let item = newModel as? EmplesMenuCellViewModel {
            self.viewModel = item
        }
    }
}
