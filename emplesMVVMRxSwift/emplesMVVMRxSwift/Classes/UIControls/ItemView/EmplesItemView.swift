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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.brown.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
    }
    
    var viewModel: EmplesListCellViewModel! {
        didSet {
            titleLabel.text = viewModel.text
            titleLabel.font = viewModel.font
            titleLabel.textColor = viewModel.textColor
            backgroundColor = viewModel.bgColor
            
            if let url = viewModel.imageURL {
                iconView.kf.setImage(with: URL(string: url))
            }
        }
    }
}

extension EmplesItemView : NibLoadableView {

}

extension EmplesItemView : ConfigurableCell {
    
    func configure(_ model: ViewCellModelProtocol) {
        
        if let item = model as? EmplesListCellViewModel {
            self.viewModel = item
        }
    }
}

